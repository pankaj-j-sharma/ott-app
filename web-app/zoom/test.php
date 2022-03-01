<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/config.php';
$zoom = new \Zoom\ZoomAPI(API_KEY, API_SECRET);

/*echo "<pre>";
print_r($zoom->listMeetings(
    array(
        "page_size"=>10,
        "type"=>"scheduled"
    )
));
echo "</pre>";*/
/*echo "<pre>";
print_r($zoom->addRegistrant(71990370768,array(
    "email"=>"jindal.asheesh@gmail.com",
    "first_name"=>"AK Jindal"
)));
echo "</pre>";*/
echo "<pre>";
print_r($zoom->getRegisteredUserList(71990370768));
echo "</pre>";
exit();
?>