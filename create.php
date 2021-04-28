<?php
require __DIR__ . '/vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf([
    'tempDir' => '/tmp',
    'format' => 'A4',
    'margin_left' => 7,
    'margin_right' => 7,
    'margin_top' => 5,
    'margin_bottom' => 5,
    'margin_header' => 0,
    'margin_footer' => 0,
]);

$html = file_get_contents('index.html');
$mpdf->WriteHTML($html);

$mpdf->Output('PHP_Pakhomov_CV.pdf', 'F');
