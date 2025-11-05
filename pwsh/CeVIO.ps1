using namespace CeVIO.Talk.RemoteService

try {
      Add-Type -Path "C:\Program Files\CeVIO\CeVIO Creative Studio (64bit)\CeVIO.Talk.RemoteService.DLL"

      [ServiceControl]::StartHost($false)
      $talker = New-Object Talker -ArgumentList ([string]$null)
      $talker.Cast = "IA"
      $talker.Volume = 100
      $talker.ToneScale = 100
      $state = $talker.Speak("こんにちは")
      $state.Wait()
      $phonemes = $talker.GetPhonemes("はじめまして")
      foreach ($phoneme in $phonemes) {
            Write-Host "$($phoneme.Phoneme) $($phoneme.StartTime) $($phoneme.EndTime)"
      }
      [ServiceControl]::CloseHost()
}
catch {
      Write-Error "Failed $_"
}