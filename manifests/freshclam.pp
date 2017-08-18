#This class configure freshclam

#parameter [clamd_options] NOT CHANGE, this parameter is usage for template
class clamav::freshclam (

  String            $freshclam_service_ensure   = $clamav::freshclam_service_ensure,
  Boolean           $freshclam_service_enable   = $clamav::freshclam_service_enable,
  String            $freshclam_package_version  = $clamav::freshclam_package_version,
  Boolean           $freshclam_install          = $clamav::freshclam_install,
  Array             $freshclam_package          = $clamav::freshclam_package,
  Optional[String]  $freshclam_config           = $clamav::freshclam_config,
  Optional[String]  $freshclam_service          = $clamav::freshclam_service,
  Optional[String]  $freshclam_sysconfig        = $clamav::freshclam_sysconfig,
  Boolean           $allow_supplementary_groups = false,
  Boolean           $bytecode                   = true,
  Optional[Integer] $checks                     = 24,
  Optional[String]  $compress_local_database    = 'no',
  Optional[Integer] $connect_timeout            = 30,
  Optional[String]  $dns_database_info          = 'current.cvd.clamav.net',
  Optional[String]  $database_directory         = '/var/lib/clamav',
  Optional[String]  $database_mirror            = 'db.local.clamav.net',
  String            $database_owner             = $clamav::freshclam_databaseowner,
  Boolean           $debug                      = false,
  Boolean           $foreground                 = false,
  Optional[String]  $log_facility               = 'LOG_LOCAL6',
  Optional[Integer] $log_file_max_size          = 0,
  Boolean           $log_rotate                 = true,
  Boolean           $log_syslog                 = false,
  Boolean           $log_time                   = true,
  Boolean           $log_verbose                = false,
  Optional[Integer] $max_attempts               = 5,
  String            $pid_file                   = $clamav::freshclam_pidfile,
  Optional[Integer] $receive_timeout            = 31,
  Optional[String]  $scripted_updates           = 'yes',
  Optional[String]  $test_databases             = 'yes',
  String            $update_log_file            = $clamav::freshclam_updatelogfile,
  Boolean           $safe_browsing              = false,
  Boolean           $notify_clamd               = false,
  Hash              $freshclam_options          = {
    'Bytecode'                 => $bytecode,
    'Checks'                   => $checks,
    'CompressLocalDatabase'    => $compress_local_database,
    'ConnectTimeout'           => $connect_timeout,
    'DNSDatabaseInfo'          => $dns_database_info,
    'DatabaseDirectory'        => $database_directory,
    'DatabaseMirror'           => $database_mirror,
    'DatabaseOwner'            => $database_owner,
    'Debug'                    => $debug,
    'Foreground'               => $foreground,
    'LogFacility'              => $log_facility,
    'LogFileMaxSize'           => $log_file_max_size,
    'LogRotate'                => $log_rotate,
    'LogSyslog'                => $log_syslog,
    'LogTime'                  => $log_time,
    'LogVerbose'               => $log_verbose,
    'MaxAttempts'              => $max_attempts,
    'PidFile'                  => $pid_file,
    'ReceiveTimeout'           => $receive_timeout,
    'ScriptedUpdates'          => $scripted_updates,
    'TestDatabases'            => $test_databases,
    'UpdateLogFile'            => $update_log_file,
    'SafeBrowsing'             => $safe_browsing,
    'NotifyClamd'              => $notify_clamd,
  }

){

  #install freshclam
  package { $freshclam_package:
    ensure => $freshclam_package_version,
  }

  $freshclam_options.each | $key, $value| {
    if $value == undef {
      $change = "rm ${key}"
    }else {
      $change = "set  ${key} ${value}"
    }

    augeas { "manage freshclam '${key}' ":
      incl    => $freshclam_config,
      lens    => 'Clamav.lns',
      changes => $change,
      require => Package[$freshclam_package],
      #notify  => Service['freshclam_service'],
    }
  }

  if $freshclam_service {
    service { 'freshclam_service':
      ensure     => $freshclam_service_ensure,
      name       => $freshclam_service,
      enable     => $freshclam_service_enable,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
