
$BaseFolder = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\"

$ht_folders = @{
    Video = "{374DE290-123F-4565-9164-39C4925E467B}";
    LocalDocuments = "{d3162b92-9365-467a-956b-92703aca08af}";
    Documents = "{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}";
    MyVideos = "{A0953C92-50DC-43bf-BE83-3742FED03C9C}";
    LocalVideos = "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}";
    LocalMusic = "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}";
    MyPictures = "{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}";
    LocalPictures = "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}";
    MyMusic = "{1CF1260C-4DD0-4ebb-811F-33C572699FDE}";
    #Downloads = "{374DE290-123F-4565-9164-39C4925E467B}";
    #LocalDownloads = "{088e3905-0323-4b02-9826-5d99428e115f}";
    #Desktop="{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"; 
    }

#$ht_folders.Keys | sort 


foreach($key in $ht_folders.keys)
{   
    $folder_id = $ht_folders[$key]
    $message = 'removing {0} = {1} ' -f $key, $folder_id
    Write-Output $message

    $oldPath = $BaseFolder + $folder_id
    $newPath = $BaseFolder + "Copy_" + $folder_id
    #Write-Output "oldPath: $oldPath"
    #Write-Output "newPath: $newPath"
    reg copy $oldPath $newPath
    reg delete $oldPath /f

}