# Class: clamav
# ===========================
#
# Full description of class clamav here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'clamav': }
#
# Authors
# -------
#
# Author Name <puppet@conceiti.com.br>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class clamav (

  #clamd
             $clamd_service_ensure     = $clamav::params::clamd_service_ensure,
            $clamd_service_enable     = $clamav::params::clamd_service_enable,
             $clamd_service            = $clamav::params::clamd_service,
             $clamd_package_version    = $clamav::params::clamd_package_version,
              $clamd_package            = $clamav::params::clamd_package,
             $clamd_databasedirectory  = $clamav::params::clamd_databasedirectory,
            $clamd_logrotate          = $clamav::params::clamd_logrotate,
            $clamd_logsyslog          = $clamav::params::clamd_logsyslog,
   $clamd_temporarydirectory = $clamav::params::clamd_temporarydirectory,
             $clamd_user               = $clamav::params::clamd_user,
             $clamd_group              = $clamav::params::clamd_group,
             $clamd_config	           = $clamav::params::clamd_config,
            $clamd_install            = true,
   $clamd_log_file           = $clamav::params::clamd_logfile,

  #clamav milter
  String  $clamav_milter_service_ensure     = $clamav::params::clamav_milter_service_ensure,
  Boolean $clamav_milter_service_enable     = $clamav::params::clamav_milter_service_enable,
  String  $clamav_milter_package_version    = $clamav::params::clamav_milter_package_version,
  Array   $clamav_milter_package            = $clamav::params::clamav_milter_package,
  String  $clamav_milter_config             = $clamav::params::clamav_milter_config,
  String  $clamav_milter_service            = $clamav::params::clamav_milter_service,
  String  $clamav_milter_user               = $clamav::params::clamav_milter_user,
  String  $clamav_milter_group              = $clamav::params::clamav_milter_group,
  String  $clamav_milter_miltersocket       = $clamav::params::clamav_milter_miltersocket,
  String  $clamav_milter_logfile            = $clamav::params::clamav_milter_logfile,
  String  $clamav_milter_pidfile            = $clamav::params::clamav_milter_pidfile,
  Boolean $clamav_milter_logrotate          = $clamav::params::clamav_milter_logrotate,
  Boolean $clamav_milter_logsyslog          = $clamav::params::clamav_milter_logsyslog,
  String  $clamav_milter_temporarydirectory = $clamav::params::clamav_milter_temporarydirectory,
  Boolean $clamd_milter_install             = true,

  #freshscan
  String           $freshclam_service_ensure  = $clamav::params::freshclam_service_ensure,
  Boolean          $freshclam_service_enable  = $clamav::params::freshclam_service_enable,
  String           $freshclam_package_version = $clamav::params::freshclam_package_version,
  Array            $freshclam_package         = $clamav::params::freshclam_package,
  String           $freshclam_config          = $clamav::params::freshclam_config,
  Optional[String] $freshclam_service         = $clamav::params::freshclam_service,
  String           $freshclam_databaseowner   = $clamav::params::freshclam_databaseowner,
  String           $freshclam_updatelogfile   = $clamav::params::freshclam_updatelogfile,
  Optional[String] $freshclam_sysconfig       = $clamav::params::freshclam_sysconfig,
  String           $freshclam_pidfile         = $clamav::params::freshclam_pidfile,
  Boolean          $freshclam_install         = true,

)inherits clamav::params {

  if $repo_dep { require '::epel' }

  if $clamd_install {
    Class { '::clamav::clamd': }
  }

  if $freshclam_install {
    Class { '::clamav::freshclam': }
  }

  if $clamd_milter_install {
    Class { '::clamav::milter': }
  }

}
