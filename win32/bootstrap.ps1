function Run-Elevated ($scriptblock)
{
  # TODO: make -NoExit a parameter
  # TODO: just open PS (no -Command parameter) if $scriptblock -eq ''
  $sh = new-object -com 'Shell.Application'
  $sh.ShellExecute('powershell', "-NoExit -Command $scriptblock", '', 'runas')
}

function Install-Choco ()
{
    Run-Elevated("iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))")
}

Install-Choco