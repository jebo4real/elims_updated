<?php

$table = <<<EOT
(
	SELECT candidate.id, candidate.image, student.fullname , student.form, department.name AS dname, position.name AS pname
	,class.name AS cname FROM candidate
	LEFT JOIN student ON candidate.studentid = student.id 
	LEFT JOIN position ON candidate.positionid = position.id
	LEFT JOIN department ON student.department = department.id
	LEFT JOIN class ON student.class = class.id
)temp
EOT;

// Table's primary key
$primaryKey = 'id';


$columns = array(
	array( 'db' => 'pname', 'dt' => 0 ),
	array( 'db' => 'fullname', 'dt' => 1 ),
	array( 'db' => 'form',  'dt' => 2 ),
	array( 'db' => 'dname',   'dt' => 3 ),
	array( 'db' => 'cname',   'dt' => 4 ),
	array( 'db' => 'image',   'dt' => 5 )
);

// SQL server connection information
$sql_details = array(
	'user' => 'root',
	'pass' => '',
	'db'   => 'voting',
	'host' => 'localhost'
);

require( 'sspedit.class.php' );


echo json_encode(
	SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
);

