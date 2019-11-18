<?php
#
# Main page for printing daily patient records
#
include("redirect.php");
include("includes/db_lib.php");
include("includes/script_elems.php");
include("includes/page_elems.php");
include("includes/user_lib.php");
LangUtil::setPageId("reports");


$page_elems = new PageElems();
$script_elems = new ScriptElems();
$script_elems->enableJquery();
$script_elems->enableTableSorter();
$script_elems->enableDragTable();

//AS Fixing error of invalid lab config id
	session_start();
$user = get_user_by_name($_SESSION['username']);
$lab_config_id = $user->labConfigId;
//$lab_config_id = $_REQUEST['l'];
$lab_section = $_REQUEST['labsec'];

require_once( "../includes/db_constants.php" );



$uiinfo = "from=".$date_from."&to=".$date_to;
putUILog('daily_log_patients', $uiinfo, basename($_SERVER['REQUEST_URI'], ".php"), 'X', 'X', 'X');

$lab_config = get_lab_config_by_id($lab_config_id);
$saved_db = DbUtil::switchToLabConfig($lab_config_id);


$lab_section_name = getTestCatName_by_cat_id($lab_config_id, $lab_section);

DbUtil::switchRestore($saved_db);
$report_id = $REPORT_ID_ARRAY['supplypg.php'];
//$report_config = $lab_config->getReportConfig($report_id);

$margin_list = $report_config->margins;


$user = get_user_by_id($_SESSION['user_id']);

for($i = 0; $i < count($margin_list); $i++)
{
	$margin_list[$i] = ($SCREEN_WIDTH * $margin_list[$i] / 100);
}
?>
<script type='text/javascript'>
function export_as_excel(div_id){
		$('#'+div_id).table2excel({
			exclude: ".noExl",
			name: "Excel Document Name",
			filename: "myFileName",
			fileext: ".xls",
			exclude_img: true,
			exclude_links: true,
			exclude_inputs: true
		});

}


function export_as_word(div_id)
{
	var content = $('#'+div_id).html();
	$('#word_data').attr("value", content);
	$('#word_format_form').submit();
}

function print_content(div_id)
{
	var DocumentContainer = document.getElementById(div_id);
	var WindowObject = window.open("", "PrintWindow", "toolbars=no,scrollbars=yes,status=no,resizable=yes");
	var html_code = DocumentContainer.innerHTML;
	var do_landscape = $("input[name='do_landscape']:checked").attr("value");
	if(do_landscape == "Y")
		html_code += "<style type='text/css'> #report_config_content {-moz-transform: rotate(-90deg) translate(-300px); } </style>";
	WindowObject.document.writeln(html_code);
	WindowObject.document.close();
	WindowObject.focus();
	WindowObject.print();
	WindowObject.close();
	//javascript:window.print();
}

$(document).ready(function(){
	$('#report_content_table5').tablesorter();

	//load data table for inventory supply
	$('#inv_tb').DataTable({
		"destroy": true,
    "processing": true,
		"dom": 'Bfrtip',
		"buttons": [
            "csv",
			{
				title: "Inventory Report (Supply)",
        extend: 'print',
				exportOptions: {
					stripHtml: false
				},
        customize: function ( win ) {
            $(win.document.body)
                .css( 'font-size', '10pt' );
            $(win.document.body).find( 'table' )
                .css( 'font-size', 'inherit' );
        }
      },
				{
				 title: "Inventory Report (Supply)",
				 extend: 'pdf',
				 text: 'Pdf',
				 exportOptions: {

				 }
			 }

        ]

	});


});
</script>
<form name='word_format_form' id='word_format_form' action='export_word.php' method='post' target='_blank'>
	<input type='hidden' name='data' value='' id='word_data' />
</form>
<input type='radio' name='do_landscape' value='N' <?php
	if($report_config->landscape == false) echo " checked ";
?>>Portrait</input>
&nbsp;&nbsp;
<input type='radio' name='do_landscape' value='Y' <?php
	if($report_config->landscape == true) echo " checked ";
?>>Landscape</input>&nbsp;&nbsp;
<input type='button' onclick="javascript:print_content('export_content');" value='<?php echo LangUtil::$generalTerms['CMD_PRINT']; ?>'></input>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' onclick="javascript:export_as_word('export_content');" value='<?php echo LangUtil::$generalTerms['CMD_EXPORTWORD']; ?>'></input>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' onclick="javascript:export_as_excel('export_content');" value='<?php echo "Export to excel"; ?>'></input>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' onclick="javascript:window.close();" value='<?php echo LangUtil::$generalTerms['CMD_CLOSEPAGE']; ?>'></input>
&nbsp;&nbsp;&nbsp;&nbsp;
<!--?php $page_elems->getTableSortTip(); ?-->
<hr>
<div id='export_content'>
<link rel='stylesheet' type='text/css' href='css/table_print.css' />
<!-- DataTables -->
<link rel="stylesheet" href="css/datatables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<div id='report_config_content'>
<br>Inventory Report (Supply)<br>
<b>Reported</b>
<style type='text/css'>

</style>
<!--Table for supplied inventory report-->
<table class='print_entry_border draggable' id='inv_tb' name="inv_tb">
<thead>
	<tr>
		<td>Raegent Name</td>
		<td>Unit</td>
		<td>Cost Per Unit</td>
		<td>Expiry Date</td>
		<td>Manufacturer</td>
		<td>Supplier</td>
		<td>Quantity Ordered</td>
		<td>Quantity Supplied</td>
		<td>Date Of Order</td>
		<td>Date Of Supply</td>
		<td>Date Of Reception</td>
	</tr>
</thead>

<tbody>
	<?php
	//retrieving data from inv_supply, inv_reagent tables
		$date_from = $_POST['df'];
		$date_to = $_POST['dt'];
		if($date_from){
			$query = "SELECT inv_reagent.*, inv_supply.* FROM inv_reagent
			LEFT JOIN inv_supply ON inv_reagent.id = inv_supply.reagent_id
			WHERE date_of_supply >= '$date_from' AND date_of_supply <= '$date_to'";
		}else{
			$query = "SELECT inv_reagent.*, inv_supply.* FROM inv_reagent
			LEFT JOIN inv_supply ON inv_reagent.id = inv_supply.reagent_id";
		}
			$result = mysql_query( $query, $con );
			$row_count = mysql_num_rows( $result );
				while ( $row = mysql_fetch_assoc($result) ){
	?>
	<tr>
		<td><?php echo $row["name"]; ?></td>
		<td><?php echo $row["unit"]; ?></td>
		<td><?php echo $row["cost_per_unit"]; ?></td>
		<td><?php echo $row["expiry_date"]; ?></td>
		<td><?php echo $row["manufacturer"]; ?></td>
		<td><?php echo $row["supplier"]; ?></td>
		<td><?php echo $row["quantity_ordered"]; ?></td>
		<td><?php echo $row["quantity_supplied"]; ?></td>
		<td><?php echo $row["date_of_order"]; ?></td>
		<td><?php echo $row["date_of_supply"]; ?></td>
		<td><?php echo $row["date_of_reception"]; ?></td>
	</tr>

	<?php
		}

	?>
</tbody>

</table>

<br><br>

<style type='text/css'>

</style>
<table class='print_entry_border draggable' id='report_content_table5'>
<thead>

</thead>

<tbody>

</tbody>
</table>

<br>

</div>
</div>
