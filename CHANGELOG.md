# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Fixed
- Fixed additional error when container is restarted

## [0.3.1] - 2020-10-27
### Fixed
- Fixed error when container is restarted instead of recreated

## [0.3.0] - 2020-05-18
### Added
- Multiple Shares can be defined

### Changed
- Config names are changed to allow multiple shares.

## [0.2.0] - 2020-04-28
### Added
- Changelog
### Changed
- Specialized and renamed image for scanning purposes
- The samba server doesnt work directly on the mounted folder. Instead a script will move the files to the mounted folder.

## [0.1.1] - 2020-04-21
### Added
- Docker healthcheck for mounted folder

## [0.1.0] - 2020-04-20
### Added
- Initial Files
