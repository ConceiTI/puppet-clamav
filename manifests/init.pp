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
#    class { 'clamav':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class clamav (

  #clamd
  String  $clamd_service_ensure         = $clamav::params::clamd_service_ensure,
  Boolean $clamd_service_enable         = $clamav::params::clamd_service_enable,
  String  $clamd_package_version        = $clamav::params::clamd_package_version,
  Array   $clamd_package                = $clamav::params::clamd_package,
  String  $clamd_databasedirectory  		= $clamav::params::clamd_databasedirectory,
  Boolean $clamd_logrotate          		= $clamav::params::clamd_logrotate,
  Boolean $clamd_logsyslog          		= $clamav::params::clamd_logsyslog,
  String  $clamd_temporarydirectory 		= $clamav::params::clamd_temporarydirectory,
  String  $clamd_user			              = $clamav::params::clamd_user,
  String  $clamd_group		              = $clamav::params::clamd_group,


  #clamav milter
  String  $clamav_milter_service_ensure     = $clamav::params::clamav_milter_service_ensure,
  Boolean $clamav_milter_service_enable     = $clamav::params::clamav_milter_service_enable,
  String  $clamav_milter_package_version    = $clamav::params::clamav_milter_package_version,
  Array   $clamav_milter_package            = $clamav::params::clamav_milter_package,
  String  $clamav_milter_config		          = $clamav::params::clamav_milter_config,
  String  $clamav_milter_service            = $clamav::params::clamav_milter_service,
  String  $clamav_milter_user               = $clamav::params::clamav_milter_user,
  String  $clamav_milter_group              = $clamav::params::clamav_milter_group,
  String  $clamav_milter_miltersocket       = $clamav::params::clamav_milter_miltersocket,
	String  $clamav_milter_logfile            = $clamav::params::clamav_milter_logfile,
  String  $clamav_milter_pidfile            = $clamav::params::clamav_milter_pidfile,
  Boolean $clamav_milter_logrotate          = $clamav::params::clamav_milter_logrotate,
  Boolean $clamav_milter_logsyslog          = $clamav::params::clamav_milter_logsyslog,
  String  $clamav_milter_temporarydirectory = $clamav::params::clamav_milter_temporarydirectory,


  #freshscan
  String  $freshclam_service_ensure      = $clamav::params::freshclam_service_ensure,
  Boolean $freshclam_service_enable      = $clamav::params::freshclam_service_enable,
  String  $freshclam_package_version     = $clamav::params::freshclam_package_version,
  Array   $freshclam_package             = $clamav::params::freshclam_package,


)inherits clamav::params {
  include clamav::install
}
