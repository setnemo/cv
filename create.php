<?php

require 'vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf([
    'tempDir' => '/tmp',
    'format' => 'A4',
    'margin_left' => 9,
    'margin_right' => 9,
    'margin_top' => 9,
    'margin_bottom' => 9,
    'margin_header' => 0,
    'margin_footer' => 0,
]);

$html = file_get_contents('index.html');

$html = strtr($html, [
    'experience_years' => (new NumberFormatter("en", NumberFormatter::SPELLOUT))
                                ->format(((new \DateTime('2015-05-01'))->diff(new \DateTime()))->format('%Y'))
]);

$mpdf->WriteHTML($html);

$mpdf->Output('PHP_Pakhomov_CV.pdf', 'F');
