# My autoupdate for CV

Created with php and github actions

## How it works

All automation I configured with [Github Actions](.github/workflows/main.yml). First of all I installed composer dependency, because I used mpdf/mpdf library for export html template to pdf file. After that run [php script](./create.php) via docker-compose. This script take index.html, fill experience_years and save result to pdf. Finally Github Actions push changes to reposity


## Link to my CV

[PHP_Pakhomov_CV.pdf](./PHP_Pakhomov_CV.pdf)

> Artem Pakhomov, 2021, MIT License
> 
