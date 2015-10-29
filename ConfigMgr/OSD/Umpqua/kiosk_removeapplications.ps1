
#Remove unneeded applications



$Apps = `
    "Microsoft.Bing"`
    ,"Microsoft.Camera"`
    ,"Microsoft.Microsoftskydrive"`
    ,"Microsoft.windowscommunicationapps"`
    ,"Microsoft.windowsphotos"`
    ,"Microsoft.xboxlivegames"`
    ,"Microsoft.zunemusic"`
    ,"Microsoft.zunevideo"
    



ForEach($App in $Apps) {

    $PackageFullName = (Get-AppxPackage $App).PackageFullName

    If((Get-AppxPackage $App).PackageFullName) {
        remove-AppxProvisionedPackage -online -packagename $PackageFullName
        remove-AppXPackage -package $PackageFullName

    }


}


