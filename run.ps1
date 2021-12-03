[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [ValidateSet("start", "stop", "delete", "bootstrap", "sonar")]
    [String]
    $Operation,
    [Parameter(Mandatory = $false)]
    [String]
    $OperationArg1
)
begin {
    Write-Host "======================> run.ps1 started" -ForegroundColor Green
    Write-Host "Operation:" -NoNewline
    Write-Host "$Operation" -ForegroundColor Yellow    
}


process {
    Write-Host "======================> run.ps1 processing" -ForegroundColor Green

    if ($Operation -eq "start") {
        docker-compose up --remove-orphans -d
    }
    elseif ($Operation -eq "stop") {
        docker-compose stop
    }
    elseif ($Operation -eq "delete") {
        docker-compose down -v
    }
    elseif ($Operation -eq "sonar") {
        dotnet dotnet-sonarscanner begin /k:"EShop" /d:sonar.login="3beb66b18b4956695ef93896fa7c9b5fce24b231" /d:sonar.host.url="http://localhost:9000" /d:sonar.language="cs" /d:sonar.cs.opencover.reportsPaths="./sonarqubecoverage/SonarQube.xml"
        dotnet build .\Unisinos.EngSoftware.EShop.sln        
        dotnet test .\Unisinos.EngSoftware.EShop.sln --collect:"XPlat Code Coverage"
        dotnet reportgenerator "-reports:**\TestResults\*\coverage.cobertura.xml" "-targetdir:sonarqubecoverage" "-reporttypes:SonarQube"
        dotnet dotnet-sonarscanner end /d:sonar.login="3beb66b18b4956695ef93896fa7c9b5fce24b231"
    }
    elseif ($Operation -eq "bootstrap") {
        # Installing necessary dotnet tools
        dotnet new tool-manifest
        dotnet tool update dotnet-reportgenerator-globaltool

        # Building container images
        docker-compose build
    }
}

end {
    Write-Host "======================> run.ps1 finished processing" -ForegroundColor Green
}
