#Install package this module
class clamav::install {

  #install clamd
  package { $clamav::clamd_package:
    ensure => $clamav::clamd_package_version,
  }

  #install clamav-milter
  package { $clamav::clamav_milter_package:
    ensure => $clamav::clamav_milter_package_version,

  }

  #install freshscan
  package { $clamav::freshclam_package:
    ensure => $clamav::freshclam_package_version,

  }


}
