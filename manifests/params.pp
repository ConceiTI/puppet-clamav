#This class set parameters this clamav module
class clamav::params {

  # Default vars
  #
  # Clamav vars
  $clamd_service_ensure          = 'running'
  $clamd_service_enable          = true
  $clamd_package_version         = 'latest'
  $clamd_install                 = true

  #
  # Clamav milter vars
  $clamav_milter_service_ensure  = 'running'
  $clamav_milter_service_enable  = true
  $clamav_milter_package_version = 'latest'
  $clamd_milter_install          = true

  #
  # freshclam vars
  $freshclam_service_ensure      = 'running'
  $freshclam_service_enable      = true
  $freshclam_package_version     = 'latest'
  $freshclam_install             = true


  case $facts['os']['name'] {
    'Debian', 'Ubuntu' : {
      #depedent the epel for redhat
      $repo_dep = false

      #clamd
      $clamd_package            = ['clamav','clamav-daemon','clamav-base']
      $clamd_service            = 'clamav-daemon'
      $clamd_config             =  '/etc/clamav/clamd.conf'
      $clamd_localsocket        = '/var/run/clamav/clamd.ctl'
      $clamd_logfile            = '/var/log/clamav/clamav.log'
      $clamd_pidfile            = '/var/run/clamav/clamd.pid'
      $clamd_databasedirectory  = '/var/tmp'
      $clamd_logrotate          = true
      $clamd_logsyslog          = true
      $clamd_temporarydirectory = undef
      $clamd_user               = 'clamav'
      $clamd_group              = 'clamav'

      #clamav-milter
      $clamav_milter_package            = ['clamav-milter']
      $clamav_milter_config             = '/etc/clamav/clamav-milter.conf'
      $clamav_milter_service            = 'clamav-milter'
      $clamav_milter_user               = 'clamav'
      $clamav_milter_group              = 'clamav'
      $clamav_milter_miltersocket       = '/var/run/clamav/clamav-milter.ctl'
      $clamav_milter_logfile            = '/var/log/clamav/clamav-milter.log'
      $clamav_milter_pidfile            = '/var/run/clamav/clamav-milter.pid'
      $clamav_milter_logrotate          = true
      $clamav_milter_logsyslog          = false
      $clamav_milter_temporarydirectory = '/tmp'

      #freshclam
      $freshclam_package       = ['clamav-freshclam']
      $freshclam_config        = '/etc/clamav/freshclam.conf'
      $freshclam_service       = 'clamav-freshclam'
      $freshclam_databaseowner = 'clamav'
      $freshclam_updatelogfile = '/var/log/clamav/freshclam.log'
      $freshclam_sysconfig     = undef
      $freshclam_delay         = undef
      $freshclam_pidfile       = '/var/run/clamav/freshclam.pid'

    }
    'RedHat', 'CentOS' : {
      #depedent the epel
      $repo_dep = true
        
      if $facts['os']['release']['major'] == '6' {
        $clamd_package         = ['clamav']
        $clamav_milter_package = ['clamav-milter']
        $freshclam_package     = ['clamav-db']
        $clamd_service            = 'clamd'
      }else{
        $clamd_package         = ['clamav','clamav-scanner','clamav-scanner-systemd']
        $clamav_milter_package = ['clamav-milter','clamav-milter-systemd']
        $freshclam_package     = ['clamav-update']
        $clamd_service            = 'clamd@scan'
      }

      #clamd
      $clamd_config             = '/etc/clamd.d/scan.conf'
      $clamd_localsocket        = '/var/run/clamd.scan/clamd.sock'
      $clamd_logfile            = '/var/log/clamd.scan'
      $clamd_pidfile            = '/var/run/clamd.scan/clamd.pid'
      $clamd_databasedirectory  = '/var/tmp'
      $clamd_logrotate          = true
      $clamd_logsyslog          = true
      $clamd_temporarydirectory = undef
      $clamd_user               = 'clamscan'
      $clamd_group              = 'virusgroup'

      #clamav-milter
      $clamav_milter_config             = '/etc/mail/clamav-milter.conf'
      $clamav_milter_service            = 'clamav-milter'
      $clamav_milter_user               = 'clamilt'
      $clamav_milter_group              = 'virusgroup'
      $clamav_milter_miltersocket       = '/var/run/clamav-milter/clamav-milter.socket'
      $clamav_milter_logfile            = '/var/log/clamav-milter.log'
      $clamav_milter_pidfile            = '/var/run/clamav-milter/clamav-milter.pid'
      $clamav_milter_logrotate          = true
      $clamav_milter_logsyslog          = true
      $clamav_milter_temporarydirectory = '/var/tmp'

      #freshclam
      $freshclam_config        = '/etc/freshclam.conf'
      $freshclam_service       = undef
      $freshclam_databaseowner = 'clamupdate'
      $freshclam_updatelogfile = '/var/log/freshclam.log'
      $freshclam_sysconfig     = '/etc/sysconfig/freshclam'
      $freshclam_delay         = undef
      $freshclam_pidfile       = '/var/run/freshclam.pid'
    }
    default : {
      notice('This OS not supported')
    }
  }

  $freshclam_options = {
    'AllowSupplementaryGroups' => false,
    'Bytecode'                 => true,
    'Checks'                   => '24',
    'CompressLocalDatabase'    => 'no',
    'ConnectTimeout'           => '30',
    'DNSDatabaseInfo'          => 'current.cvd.clamav.net',
    'DatabaseDirectory'        => $clamd_databasedirectory,
    'DatabaseMirror'           => ['db.local.clamav.net', 'database.clamav.net'],
    'DatabaseOwner'            => $freshclam_databaseowner,
    'Debug'                    => false,
    'Foreground'               => false,
    'LogFacility'              => 'LOG_LOCAL6',
    'LogFileMaxSize'           => '0',
    'LogRotate'                => $clamd_logrotate,
    'LogSyslog'                => $clamd_logsyslog,
    'LogTime'                  => true,
    'LogVerbose'               => false,
    'MaxAttempts'              => '5',
    'PidFile'                  => $freshclam_pidfile,
    'ReceiveTimeout'           => '30',
    'ScriptedUpdates'          => 'yes',
    'TestDatabases'            => 'yes',
    'UpdateLogFile'            => $freshclam_updatelogfile,
  }
}
