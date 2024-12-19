@echo off

setlocal enabledelayedexpansion

for /f "usebackq tokens=1,* delims== " %%i in (".env") do (
    set %%i=%%j
)

for %%i in ("%envfile%") do (
    set MDW_PROJECT_DIR=%%~dpi
)

set MDW_PROJECT_DATA_DIR=.\data
set MDW_PROJECT_PERSISTENT_MOODLEDATA_DIR=.\moodledata
set MDW_PROJECT_PERSISTENT_DATABASE_DIR=.\database
set MDW_PROJECT_DOCKER_LOCAL=.\docker
set USER=%USERNAME%

set dockerconfigfiles=
for %%f in (%MDW_PROJECT_DOCKER_LOCAL%\*.yml) do (
    set dockerconfigfiles=!dockerconfigfiles! -f %%f
)

call bin\moodle-docker-compose.cmd %dockerconfigfiles% %*