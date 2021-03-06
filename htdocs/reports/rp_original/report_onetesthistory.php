<?php
#
# Lists patient test history in printable format
#
include("redirect.php");
include("includes/db_lib.php");
include("includes/script_elems.php");
include("includes/page_elems.php");
LangUtil::setPageId("reports");
putUILog('reports_onetesthistory', 'X', basename($_SERVER['REQUEST_URI'], ".php"), 'X', 'X', 'X');

# Helper function to fetch test history records
function get_records_to_print($lab_config, $patient_id, $specimen_id) {
	
	$retval=array();
			$query_string =
			"SELECT * FROM test,specimen ".
			"WHERE specimen.specimen_id=$specimen_id and test.specimen_id=specimen.specimen_id and specimen.patient_id=$patient_id";
			
	$resultset = query_associative_one($query_string);
	if($resultset == null)
		echo "hiral";
	
	$test = Test::getObject($resultset);
	$hide_patient_name = TestType::toHidePatientName($test->testTypeId);
	
	if( $hide_patient_name == 1 )
					$hidePatientName = 1;
	
	$specimen = get_specimen_by_id($test->specimenId);
	$retval[] = array($test, $specimen, $hide_patient_name);
	
	return $retval;
}

$lab_config_id =$_SESSION['lab_config_id'];
$patient_id = $_GET['ppid'];
DbUtil::switchToLabConfig($lab_config_id);
$lab_config = get_lab_config_by_id($lab_config_id);
$report_id = $REPORT_ID_ARRAY['reports_testhistory.php'];
$report_config = $lab_config->getReportConfig($report_id);
$margin_list = $report_config->margins;
for($i = 0; $i < count($margin_list); $i++)
{
	$margin_list[$i] = ($SCREEN_WIDTH * $margin_list[$i] / 100);
}
?>
<html>
<head>
<?php
$script_elems = new ScriptElems();
$script_elems->enableJQuery();
$script_elems->enableTableSorter();
$script_elems->enableDragTable();
$script_elems->enableLatencyRecord();
$script_elems->enableEditInPlace();
$page_elems = new PageElems();
?>
<script type='text/javascript'>
var curr_orientation = 0;

function export_as_word(div_id)
{
	
	var content = $('#'+div_id).html();
	$('#word_data').attr("value", content);
	$('#word_format_form').submit();
}

function print_content(div_id)
{
	var user_id = <?php echo $_SESSION['user_id']; ?>;
	var p_id = <?php echo $patient_id; ?>;
	$.ajax({
		type : 'POST',
		url : 'ajax/fetchUserLog.php',
		data: "p_id="+p_id+"&log_type=PRINT",
		success : function (data) {
			if ( data != "false" ) {
					
				var content = "The results for this patient have been printed already by the following users.";
				content+= "\n\n"+data+"\n\n";
				content += "\nDo you wish to print again?";
				// document.getElementById("dialog").innerHTML = content;
				// $(function() {
				// 	$( "#dialog" ).dialog();
				// });
				var r = confirm(content);
				if (r == false) {
					return;
				} 
				
			}
			$("#myNicPanel").hide();
			javascript:window.print();
			var data_string = "user_id="+user_id+"&p_id="+p_id+"&log_type=PRINT";
			$.ajax({
				type : 'POST',
				url : 'ajax/addUserLog.php',
				data: data_string
			});	
		}
	});
}

$(document).ready(function(){
	
	$('#report_content_table1').tablesorter();
	$('.editable').editInPlace({
		callback: function(unused, enteredText) {
			return enteredText; 
		},
		show_buttons: false,
		bg_over: "FFCC66"			
	});
	$("input[name='do_landscape']").click( function() {
		change_orientation();
	});
});

function change_orientation()
{
	var do_landscape = $("input[name='do_landscape']:checked").attr("value");
	if(do_landscape == "Y" && curr_orientation == 0)
	{
		$('#report_config_content').removeClass("portrait_content");
		$('#report_config_content').addClass("landscape_content");
		curr_orientation = 1;
	}
	if(do_landscape == "N" && curr_orientation == 1)
	{
		$('#report_config_content').removeClass("landscape_content");
		$('#report_config_content').addClass("portrait_content");
		curr_orientation = 0;
	}
}

$(document).ready(function(){
  // Reset Font Size
  var originalFontSize = $('#report_content').css('font-size');
   $(".resetFont").click(function(){
  $('#report_content').css('font-size', originalFontSize);
  $('#report_content table').css('font-size', originalFontSize);
  $('#report_content table th').css('font-size', originalFontSize);
  });
  // Increase Font Size
  $(".increaseFont").click(function(){
  	var currentFontSize = $('#report_content').css('font-size');
 	var currentFontSizeNum = parseFloat(currentFontSize, 10);
    var newFontSize = currentFontSizeNum*1.2;
		$('#report_content').css('font-size', newFontSize);
	$('#report_content table').css('font-size', newFontSize);
	$('#report_content table th').css('font-size', newFontSize);
	return false;
  });
  // Decrease Font Size
  $(".decreaseFont").click(function(){
  	var currentFontSize = $('#report_content').css('font-size');
 	var currentFontSizeNum = parseFloat(currentFontSize, 10);
    var newFontSize = currentFontSizeNum*0.8;
	$('#report_content').css('font-size', newFontSize);
	$('#report_content table').css('font-size', newFontSize);
	$('#report_content table th').css('font-size', newFontSize);
	return false;
  });
  
   $(".bold").click(function(){
  	 var selObj = window.getSelection();
		alert(selObj);
		selObj.style.fontWeight='bold';
	return false;
  });
});
</script>
<style type="text/css">
p.main {text-align:justify;}
</style>

</head>
<body>
<div id='options_header'>
<form name='word_format_form' id='word_format_form' action='export_word.php' method='post' target='_blank'>
	<input type='hidden' name='data' value='' id='word_data' />
	<input type='hidden' name='lab_id' value='<?php echo $lab_config_id; ?>' id='lab_id'>
</form>

<table class='no_border'>
	<tr>
	<td>
	&nbsp;&nbsp;&nbsp;&nbsp;
			<input type='button' onclick="javascript:print_content('report_content');" value='<?php echo LangUtil::$generalTerms['CMD_PRINT']; ?>'></input>
	</td>
	<td>
		<table class='no border'>
	<tr valign='top'>
		
	<td>
	<input type='radio' name='do_landscape' value='N'<?php
			//if($report_config->landscape == false) echo " checked ";
			echo " checked ";
			?>>Portrait</input>
	</td>
	<td>
		<input type='radio' name='do_landscape' value='Y' <?php
			//if($report_config->landscape == true) echo " checked ";
			?>>Landscape</input>
	</td>
	</tr>
	</table>
	</td>
	<td>
	&nbsp;&nbsp;
	Font
	</td>
	<td>
	<table class='no border'>
	<tr valign='top'><td>
	<input  type='button' class="increaseFont" value='Increase' title="Increase Font-size"></input> <br>
	</td>
	<td>
	<input type='button' class="decreaseFont" value='Decrease' title="Decrease Font-size"></input> <br>
	<!--<input type='button' class="bold" value='Bold' title="Bold"></input> <br>-->
	
	</td>
	</tr>
	</table>
	</td>
	<td>
	&nbsp;&nbsp;
	<input type='button' onclick="javascript:export_as_word('report_word_content');" value='Export Word Document' title='<?php echo LangUtil::$generalTerms['CMD_EXPORTWORD']; ?>'></input>
	</td>
	<td>
	&nbsp;&nbsp;
	<input type='button' onclick="javascript:window.close();" value='Close' title='<?php echo LangUtil::$generalTerms['CMD_CLOSEPAGE']; ?>'></input>
	</td>
	
	</tr>
</table>
<hr>
</div>
<div id='report_content'>
<link rel='stylesheet' type='text/css' href='css/table_print.css' />
<style type='text/css'>
div.editable {
	/*padding: 2px 2px 2px 2px;*/
	margin-top: 2px;
	width:900px;
	height:20px;
}

div.editable input {
	width:700px;
}
div#printhead {
display:none;
}

@media all
{
  .page-break { display:none; }
}
@media print
{
	#options_header { display:none; }
	div#printhead {	display: block;
  }
  div#docbody {
  margin-top: 5em;
  }
}

.landscape_content {-moz-transform: rotate(90deg) translate(300px); }

.portrait_content {-moz-transform: translate(1px); rotate(-90deg) }
</style>
<style type='text/css'>
	<?php $page_elems->getReportConfigCss($margin_list); ?>
</style>
<?php $align=$report_config->alignment_header;?>
<div id='report_config_content' style='display:block;'>
<div id="docbody" name="docbody">
<?php $align=$report_config->alignment_header;?>
<div id='logo' align="<?php echo $align; ?>">
<table>
<tr>
<td>
<?php
# If hospital logo exists, include it
$logo_path = "../logos/logo_".$lab_config_id.".jpg";
$logo_path2 = "../ajax/logo_".$lab_config_id.".jpg";
$logo_path1="../../logo_".$lab_config_id.".jpg";


if(file_exists($logo_path1) === true)
{	copy($logo_path1,$logo_path);
	?>
	<img src='<?php echo "logos/logo_".$lab_config_id.".jpg"; ?>' alt="Big Boat" height='140px'    ></src>
	<?php
}
else if(file_exists($logo_path) === true)
{
?>
	<img src='<?php echo "logos/logo_".$lab_config_id.".jpg"; ?>' alt="Big Boat" height='140px' width='140px' ></src>
	<?php
}
?>
</td>
</tr>
</table>
</div>
<!--//If condition for the font size
<STYLE>H3 {FONT-SIZE: <?php echo $size; ?>}</STYLE>-->
<div id="report_word_content">
<br>
<?php $align=$report_config->alignment_header;?>
<h3  align="<?php echo $align; ?>"><?php echo $report_config->headerText; ?><?php #echo LangUtil::$pageTerms['MENU_PHISTORY']; ?></h3>
<h4 align="<?php echo $align; ?>"><?php echo $report_config->titleText; ?></h4>
<br>

<?php
$patient=get_patient_by_id($patient_id);
$specimen_id=$_GET['spid'];
if($patient == null)
{
	echo LangUtil::$generalTerms['PATIENT_ID']." $patient_id ".LangUtil::$generalTerms['MSG_NOTFOUND'];
}
else
{
	# Fetch test entries to print in report
	$record_list = get_records_to_print($lab_config, $patient_id ,  $specimen_id); 
	//Here

	# If single date supplied, check if-
	# 1. Physician name is the same for all
	# 2. Patient daily number is the same for all
	# 3. All tests were completed or not
	$physician_same = false;
	$daily_number_same = false;
	$all_tests_completed = false;
	if($date_from == $date_to)
	{
		$physician_same = true;
		$daily_number_same = true;
		$all_tests_completed = true;
		$record_count = 0;
		$previous_physician = "";
		$previous_daily_num = "";
		$count_list= count($record_list); 
		
		foreach($record_list as $record_set)
		{
			$value = $record_set;
			$test = $value[0];
			$specimen = $value[1];
			
			if( $hidePatientName == 0) 
				$hidePatientName = $value[2];
				
				if($report_config->useTestName == 1)
				{
					echo "<h3 align='center'>";
					echo LangUtil::$generalTerms['TEST']."&#45;&nbsp;";
					echo get_test_name_by_id($test->testTypeId)."</h3>";
				}
				
			if($record_count != 0)
			{
				if(strcasecmp($previous_physician, $specimen->getDoctor()) != 0)
				{
					$physician_same = false;
				}
				if(strcasecmp($previous_daily_num, $specimen->getDailyNumFull()) != 0)
				{
					$daily_number_same = false;
				}
				if($test->isPending() === true)
				{
					$all_tests_completed = false;
				}
				if($physician_same === false && $daily_number_same === false && $all_tests_completed === false)
					break;
			}
			$previous_physician = $specimen->getDoctor();
			$previous_daily_num = $specimen->getDailyNumFull();
			$record_count++;
		}
	}
	?>
	
	<table class='print_entry_border'>
		<tbody>
			<?php
			if($report_config->usePatientId == 1)
			{
			?>
			<tr valign='top'>
				<td><?php echo LangUtil::$generalTerms['PATIENT_ID']; ?></td>
				<td><?php echo $patient->getSurrogateId(); ?></td>
			</tr>
			<?php
			}
			if($report_config->useDailyNum == 1 && $daily_number_same === true)
			{
				?>
				<tr valign='top'>
					<td><?php echo LangUtil::$generalTerms['PATIENT_DAILYNUM']; ?></td>
					<td><?php echo $previous_daily_num; ?></td>
				</tr>
				<?php 
			}
			if($report_config->usePatientAddlId == 1)
			{
			?>
			<tr valign='top'>
				<td><?php echo LangUtil::$generalTerms['ADDL_ID']; ?></td>
				<td><?php echo $patient->getAddlId(); ?></td>
			</tr>
			<?php
			}
			if( ($report_config->usePatientName == 1) && ($hidePatientName != 1) )
			{
			?>
			<tr valign='top'>
				<td><?php echo LangUtil::$generalTerms['NAME']; ?></td>
				<td><?php echo $patient->name; ?></td>
			</tr>
			<?php
			}
			if($report_config->useAge == 1)
			{
			?>
			<tr valign='top'>
				<td><?php echo LangUtil::$generalTerms['AGE']; ?></td>
				<td><?php echo $patient->getAge(); ?></td>
			</tr>
			<?php
			}
			if($report_config->useGender == 1)
			{
			?>			
			<tr valign='top'>	
				<td><?php echo LangUtil::$generalTerms['GENDER']; ?></td>
				<td><?php echo $patient->sex; ?></td>
			</tr>
			<?php
			}
			if($report_config->useDob == 1)
			{
			?>
			<tr valign='top'>
				<td><?php echo LangUtil::$generalTerms['DOB']; ?></td>
				<td><?php echo $patient->getDob(); ?></td>
			</tr>
			<?php 
			}
			# Patient Custom fields here
			$custom_field_list = $lab_config->getPatientCustomFields();
			
			foreach($custom_field_list as $custom_field)
			{
				if(in_array($custom_field->id, $report_config->patientCustomFields))
				{	
					$field_name = $custom_field->fieldName;				
					?>
					<tr valign='top'>
					<?php
					echo "<td>";
					echo $field_name;
					echo "</td>";
					$custom_data = get_custom_data_patient_bytype($patient->patientId, $custom_field->id);
					echo "<td>";
					if($custom_data == null)
					{
						echo "-";
					}
					else
					{
						$field_value = $custom_data->getFieldValueString($lab_config->id, 2);
						if(trim($field_value) == "")
							$field_value = "-";
						echo $field_value;
					}
					echo "</td>";					
					?>
					</tr>
					<?php
				}
			}
			if($report_config->useDoctor == 1 && $physician_same === true)
			{
				?>
				<tr valign='top'>
					<td><?php echo LangUtil::$generalTerms['DOCTOR']; ?></td>
					<td><?php echo $previous_physician; ?></td>
				</tr>
				<?php 
			}
			?>
		</tbody>
	</table>
	<br>
	<?php 
	if($all_tests_completed === true && count($record_list) != 0)
	{
		//echo LangUtil::$pageTerms['MSG_ALLTESTSCOMPLETED']; 
	}
	else
	{
		//echo LangUtil::$generalTerms['TESTS']; 
	}
	?>
	<?php 
	if(count($record_list) == 0)
	{
		echo LangUtil::$generalTerms['MSG_NOTFOUND'];
	}
	else
	{
		if(isset($_REQUEST['sid']))
			{
				# Called after result entry for a single specimen
				$value = array($_REQUEST['sid'], $_REQUEST['tid']);
				$record_list = array();
				$record_list[] = $value;
				$data_list=array();
			}
			foreach($record_list as $record_set)
			{
				$value = $record_set;
				$test = $value[0];
				$specimen = $value[1];
				$id=$test->testTypeId;
				$clinical_data=get_clinical_data_by_id($test->testTypeId);
		?>	
				<?php
				
				if($report_config->useSpecimenName == 1)
				{
					//echo "<h3>";
					//echo LangUtil::$generalTerms['TYPE']."&nbsp;&#45;&nbsp;";
					//echo get_specimen_name_by_id($specimen->specimenTypeId)."</h3>";
				}
				if($report_config->useTestName == 1)
				{
					//echo "<h3>";
					//echo LangUtil::$generalTerms['TEST']."&nbsp;&#45;&nbsp;";
					//echo get_test_name_by_id($test->testTypeId)."</h3>";
				}
				if($report_config->useSpecimenAddlId != 0)
				{
					echo LangUtil::$generalTerms['SPECIMEN_ID']."&nbsp;&#45;&nbsp;";
					echo $specimen->getAuxId();
					echo "<br>";
				}
				if($clinical_data!='')
				{
				$data_list[$id]=$clinical_data;
				}
				if($report_config->useDailyNum == 1 && $daily_number_same === false)
				{
					echo LangUtil::$generalTerms['PATIENT_DAILYNUM']."&nbsp;&#45;&nbsp;";
					echo $specimen->getDailyNum()."<br>";
				}
				if($report_config->useDateRecvd == 1)
				{
					echo LangUtil::$generalTerms['R_DATE']."&nbsp;&#45;&nbsp;";
					echo DateLib::mysqlToString($specimen->dateRecvd)."<br>";
				}
				# Specimen Custom fields headers here
				$custom_field_list = $lab_config->getSpecimenCustomFields();
				foreach($custom_field_list as $custom_field)
				{
					$field_name = $custom_field->fieldName;
					$field_id = $custom_field->id;
					if(in_array($field_id, $report_config->specimenCustomFields))
					{
						echo $field_name;
					}
				}
				# Specimen Custom fields here
				$custom_field_list = $lab_config->getSpecimenCustomFields();
				foreach($custom_field_list as $custom_field)
				{
					if(in_array($custom_field->id, $report_config->specimenCustomFields))
					{
						echo "<br>";
						$custom_data = get_custom_data_specimen_bytype($specimen->specimenId, $custom_field->id);
						if($custom_data == null)
						{
							echo "-";
						}
						else
						{
							$field_value = $custom_data->getFieldValueString($lab_config->id, 1);
							if($field_value == "" or $field_value == null) 
							$field_value = "-";
							echo $field_value; 
						}
						echo "<br>";
					}
				}
				if($report_config->useComments == 1)
				{
					echo LangUtil::$generalTerms['COMMENTS']."&nbsp;&#45;&nbsp;";
					echo $specimen->getComments()."<br>";
				}
				if($report_config->useReferredTo == 1)
				{
					echo LangUtil::$generalTerms['REF_TO']."&nbsp;&#45;&nbsp;";
					echo $specimen->getReferredToName()."<br>";
				}
				if($report_config->useDoctor == 1 && $physician_same === false)
				{
					echo LangUtil::$generalTerms['DOCTOR']."&nbsp;&#45;&nbsp;";
					$doc=$specimen->getDoctor();
					echo $doc."<br>";
				}
				if($report_config->useResults == 1)
				{
					echo LangUtil::$generalTerms['RESULTS']."<br><br>";
					if(trim($test->result) == "")
					{
						echo LangUtil::$generalTerms['PENDING_RESULTS'];
					}
					else
					{
						echo $test->decodeResult();
					}
					echo "<br>";
				}
				
				if($report_config->useEntryDate == 1)
				{
					echo LangUtil::$generalTerms['E_DATE']."&nbsp;&#45;&nbsp;";
					if(trim($test->result) == "")
						echo "-";
					else
					{
						$ts_parts = explode(" ", $test->timestamp);
						echo DateLib::mysqlToString($ts_parts[0]);
					}
					echo "<br>";
				}
				if($report_config->useRemarks == 1)
				{
					echo "<br>";
					echo LangUtil::$generalTerms['RESULT_COMMENTS']."&nbsp;&#45;&nbsp;";
					echo $test->getComments()."<br>";
				}
				if($report_config->useEnteredBy == 1)
				{
					echo LangUtil::$generalTerms['ENTERED_BY']."&nbsp;&#45;&nbsp;";
					echo $test->getEnteredBy()."<br>";
				}
				if($report_config->useVerifiedBy == 1)
				{
					echo LangUtil::$generalTerms['VERIFIED_BY']."&nbsp;&#45;&nbsp;";
					echo $test->getVerifiedBy()."<br>";
				}
				if($report_config->useStatus == 1 && $all_tests_completed === false)
				{
					echo LangUtil::$generalTerms['SP_STATUS']."&nbsp;&#45;&nbsp;";
					echo $test->getStatus()."<br>";
				}
			
			}
			?>
		
		<br><br>
		<?php if($report_config->useClinicalData == 1) { 		
			if(count($data_list)==1 && count(record_list)==1) {
			?>
			<b>
				Clinical Data:
				</b>
				<?php  

					foreach($data_list as $key=>$value) {
						if(stripos($value,"!#!")===0) {
							$data=substr($value,3);
							$dat=explode("%%%",$value);
							$text=substr($dat[0],3);
							$table=$dat[1];
						}
						else if(stripos($value,"%%%")===0) {
							$text="";
							$table=substr($value,3);
						}
						else {
							$text=$value;//substr($value,3);
							$table="";
						}
						if($text!="")
							echo $text;
						if($table!="") {
							$contents=explode("###",$table);
							$name_array=$contents[0];
							$value_array=$contents[1];
							$name=explode(",",$name_array);
							$value=explode(",",$value_array);
						}
						?><table>
						<?php for($i=0;$i<count($name);$i++) {
						
							if($name[$i]!=" ") {
								?>
								<tr>
								<td>
								<?php echo $name[$i];?>
								</td>
								<td>
								<?php echo $value[$i];?>
								</td>
								</tr>
								<?php 
							}
						}
						?>
						</table>
						<?php
						
					}
					?>
					<br><br>
					<?php
			}
			else {
				$bullet=1;
				if( $data_list) {
					foreach($data_list as $key=>$value) {
						echo $bullet++ ?>). <b>Test Name:</b>
						<?php echo get_test_name_by_id ($key); ?>
						<br><b>
						Clinical Data:
						</b>
						<?php
						if(stripos($value,"!#!")===0) {
							$data=substr($value,3);
							$dat=explode("%%%",$value);
							$text=substr($dat[0],3);
							$table=$dat[1];
						}
						else if(stripos($value,"%%%")===0) {
							$table=substr($value,3);
							$text="";
						}
						else {
							$text=$value;//substr($value,3);
							$table="";
						}
						if($text!="")
							echo $text;
						if($table!=""&&stripos($value,"%%%")!=0) {
							$contents=explode("###",$table);
							$name_array=$contents[0];
							$value_array=$contents[1];
							$name=explode(",",$name_array);
							$value=explode(",",$value_array);
				
							?>
							<table>
							<?php for($i=0;$i<count($name);$i++) {
								if($name[$i]!="") {
									?>
									<tr>
									<td>
									<?php echo $name[$i];?>
									</td>
									<td>
									<?php echo $value[$i];?>
									</td>
									</tr>
									<?php 
								}
							} ?>
							</table> <?php 
						} ?>
						<br><br>
						<?php
					}
				}
			}
		}
	}
}
if(count($record_list) != 0)
{
	$latest_record = $record_list[0];
	$earliest_record = $record_list[count($record_list)-1];
	$latest_specimen = $latest_record[1];
	$earliest_specimen = $earliest_record[1];
	$latest_collection_parts = explode("-", $latest_specimen->dateCollected);
	$earliest_collection_parts = explode("-", $earliest_specimen->dateCollected);
	if(!isset($_REQUEST['yf']))
	{
?>
<script type='text/javascript'>
$(document).ready(function(){
	$('#dd_from').attr("value", "<?php echo $earliest_collection_parts[2]; ?>");
	$('#mm_from').attr("value", "<?php echo $earliest_collection_parts[1]; ?>");
	$('#yyyy_from').attr("value", "<?php echo $earliest_collection_parts[0]; ?>");
	$('#dd_to').attr("value", "<?php echo $latest_collection_parts[2]; ?>");
	$('#mm_to').attr("value", "<?php echo $latest_collection_parts[1]; ?>");
	$('#yyyy_to').attr("value", "<?php echo $latest_collection_parts[0]; ?>");
	var date_from = "<?php echo DateLib::mysqlToString($earliest_specimen->dateCollected); ?>";
	var date_to = "<?php echo DateLib::mysqlToString($latest_specimen->dateCollected); ?>";
	var html_string = "";
	if(date_from == date_to)
	{
		html_string = "<br><?php echo LangUtil::$generalTerms['DATE'].": "; ?>"+date_from;		
	}
	else
	{
		html_string = "<br><?php echo LangUtil::$generalTerms['FROM_DATE'].": "; ?>"+date_from+" | <?php echo LangUtil::$generalTerms['TO_DATE'].": "; ?>"+date_to;
	}
	
	$('#date_section').html(html_string);
});
</script>
<?php
}
}
?>
<div class='editable' title='Click to Edit'>
</div>
<div class='editable' title='Click to Edit'>
</div>
<div class='editable' title='Click to Edit'>
</div>
<!--p class="main">
............................................-->
<?php 
$new_footer_part="............................................";
$footerText=explode(";" ,$report_config->footerText);
$designation=explode(";" ,$report_config->designation);
$lab_config_id=$_SESSION['lab_config_id'];

?>

<table width=100% border="0" class="no_border" ">
<tr>
<?php for($j=0;$j<count($footerText);$j++) {?>
<td <?php if($lab_config_id==234) {?>style="font-size:14pt;"<?php }?> ><?php echo $new_footer_part; ?></td>
<?php }?>
</tr>
<tr>
<?php for($j=0;$j<count($footerText);$j++) {?>
<td align="center" <?php if($lab_config_id==234) {?>style="font-size:14pt;"<?php }?>><?php echo $footerText[$j]; ?></td>
<?php }?>
</tr>
<tr>
<?php for($j=0;$j<count($designation);$j++) {?>
<td align="center"<?php if($lab_config_id==234) {?>style="font-size:14pt;"<?php }?> ><?php echo $designation[$j]; ?></td>
<?php }?>
</tr>
</table>
</div>
</div>
</div>
</div>
</body>

</html>