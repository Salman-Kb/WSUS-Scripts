#Connect to the server
$server = Get-WsusServer -Name 'ServerName' -PortNumber 8530
#Import the workstations from a list
$List = Get-Content "C:\Users\Salman.kabboul\Desktop\Excel\WSUS-LIST.txt"
#Move each workstation in the list to specified groups, with message about every workstation
Foreach ($list in $List){
        $var = $list+".domain.com"
        Write-Host $var
        $computer = $server.GetComputerTargetByName($var)
        $newGroup = $server.GetComputerTargetGroup('669fc2ea-3ec5-4793-a7bc-77a10f5b3e9a')
        $newGroup.AddComputerTarget($computer)
        $newGroup = $server.GetComputerTargetGroup('e532d2b0-e861-4852-96b5-a7ebcc9b2a91')
        $newGroup.AddComputerTarget($computer)
        $newGroup = $server.GetComputerTargetGroup('b456f37c-e0c2-4226-8fda-8eca989229a5')
        $newGroup.AddComputerTarget($computer)
}
