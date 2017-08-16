#This class set parameters this clamav module
class clamav::params {

  # Default vars
  #
  # Clamav vars
  $clamd_service_ensure          = 'running'
  $clamd_service_enable          = true
  $clamd_package_version         = 'latest'

  #
  # Clamav milter vars
  $clamav_milter_service_ensure  = 'running'
  $clamav_milter_service_enable  = true
  $clamav_milter_package_version = 'latest'

  #
  # freshclam vars
  $freshclam_service_ensure      = 'running'
  $freshclam_service_enable      = true
  $freshclam_package_version     = 'latest'


  case $facts['os']['name'] {
    'Debian', 'Ubuntu' : {
      #clamd
      $clamd_package       = ['clamav','clamav-daemon','clamav-base']
      $clamd_service_name  = 'clamav-daemon'
      $clamd_config        =  '/etc/clamav/clamd.conf'
      $clamd_localsocket   = '/var/run/clamav/clamd.ctl'
      $clamd_logfile       = '/var/log/clamav/clamav.log'
			$clamd_pidfile			 = '/var/run/clamav/clamd.pid'
      $clamd_databasedirectory  = '/var/tmp'
      $clamd_logrotate          = true
      $clamd_logsyslog          = true
      $clamd_temporarydirectory = ''
			$clamd_user								= 'clamav'
			$clamd_group							= 'clamav'

      #clamav-milter
      $clamav_milter_package = ['clamav-milter']

      #freshclam
      $freshclam_package = ['clamav-freshclam']

    }
    'RedHat', 'CentOS' : {
      #clamd
      $clamd_package       = ['clamav','clamav-scanner','clamav-scanner-systemd']
      $clamd_service_name  = 'clamd@scan'
      $clamd_config        =  '/etc/clamd.d/scan.conf'
      $clamd_localsocket   = '/var/run/clamd.scan/clamd.sock'
      $clamd_logfile       = '/var/log/clamd.scan'
      $clamd_pidfile       = '/var/run/clamd.scan/clamd.pid'
      $clamd_databasedirectory  = '/var/tmp'
      $clamd_logrotate          = true
      $clamd_logsyslog          = true
      $clamd_temporarydirectory = ''
      $clamd_user               = 'clamscan'
      $clamd_group              = 'virusgroup'

      #clamav-milter
      $clamav_milter_package = ['clamav-milter','clamav-milter-systemd']

      #freshclam
      $freshclam_package = ['clamav-update']

    }
    default : {
      notice('This OS not supported')
    }
  }

  $clamd_options = {
    'AlgorithmicDetection'           => true,
    'AllowAllMatchScan'              => true,
    'AllowSupplementaryGroups'       => true,
    'ArchiveBlockEncrypted'          => false,
    'Bytecode'                       => true,
    'BytecodeSecurity'               => 'TrustSigned',
    'BytecodeTimeout'                => '60000',
    'CommandReadTimeout'             => '5',
    'CrossFilesystems'               => true,
    'DatabaseDirectory'              => $clamd_databasedirectory,
    'Debug'                          => false,
    'DetectBrokenExecutables'        => false,
    'DetectPUA'                      => false,
    'DisableCertCheck'               => false,
    'ExitOnOOM'                      => false,
    'ExtendedDetectionInfo'          => true,
    'FixStaleSocket'                 => true,
    'FollowDirectorySymlinks'        => false,
    'FollowFileSymlinks'             => false,
    'ForceToDisk'                    => false,
    'Foreground'                     => false,
    'HeuristicScanPrecedence'        => false,
    'IdleTimeout'                    => '30',
    'LeaveTemporaryFiles'            => false,
    'LocalSocket'                    => $clamd_localsocket,
    'LocalSocketGroup'               => $clamd_group,
    'LocalSocketMode'                => '666',
    'LogClean'                       => false,
    'LogFacility'                    => 'LOG_LOCAL6',
    'LogFile'                        => $clamd_logfile,
    'LogFileMaxSize'                 => '0',
    'LogFileUnlock'                  => false,
    'LogRotate'                      => $clamd_logrotate,
    'LogSyslog'                      => $clamd_logsyslog,
    'LogTime'                        => true,
    'LogVerbose'                     => false,
    'MaxConnectionQueueLength'       => '15',
    'MaxDirectoryRecursion'          => '15',
    'MaxEmbeddedPE'                  => '10M',
    'MaxHTMLNoTags'                  => '2M',
    'MaxHTMLNormalize'               => '10M',
    'MaxQueue'                       => '100',
    'MaxScriptNormalize'             => '5M',
    'MaxThreads'                     => '12',
    'MaxZipTypeRcg'                  => '1M',
    'OLE2BlockMacros'                => false,
    'OfficialDatabaseOnly'           => false,
    'PhishingAlwaysBlockCloak'       => false,
    'PhishingAlwaysBlockSSLMismatch' => false,
    'PhishingScanURLs'               => true,
    'PhishingSignatures'             => true,
    'PidFile'                        => $clamd_pidfile,
    'ReadTimeout'                    => '180',
    'ScanArchive'                    => true,
    'ScanELF'                        => true,
    'ScanHTML'                       => true,
    'ScanMail'                       => true,
    'ScanOLE2'                       => true,
    'ScanOnAccess'                   => false,
    'ScanPE'                         => true,
    'ScanPartialMessages'            => false,
    'ScanSWF'                        => true,
    'SelfCheck'                      => '3600',
    'SendBufTimeout'                 => '200',
    'StreamMaxLength'                => '25M',
    'StructuredDataDetection'        => false,
    'TemporaryDirectory'             => $clamd_temporarydirectory,
    'User'                           => $clamd_user,

  }

  $clamav_milter = {


  }

  $freshclam = {

  } 
}
