param([String]$path=".") #Must be the first statement in your script

$CUDA_TARGET_DIR = "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2\" 
$CUDA_BIN = $CUDA_TARGET_DIR + "bin"
$CUDA_INCLUDE = $CUDA_TARGET_DIR + "include"
$CUDA_LIB = $CUDA_TARGET_DIR + "lib\x64"

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}else{ Write "Running as Admin. Moving CUDNN to CUDA installdir." }


if((Test-Path $path"\bin\") -and (Test-Path $path"\include\") -and (Test-Path $path"\lib\")) 
{
    try{
        Copy-Item $path"\bin\*" $CUDA_BIN -Force -Recurse
        Copy-Item $path"\lib\*" $CUDA_BIN -Force -Recurse
        Copy-Item $path"\include\*" $CUDA_INCLUDE -Force -Recurse
    } catch {
        Write-Error "FAILURE TO COPY!"
        Break
    }
    Write "Copy Successful. Have fun with your CUDNN."
} else {
    echo $path"\bin\"
ls $path
    (Test-Path $path+"\bin\") 
    (Test-Path $path+"\include\") 
    (Test-Path $path+"\lib\")
     echo "This doesn't look like a CUDNN directory. If it is, please do a manual install."
}