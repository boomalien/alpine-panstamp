$ErrorActionPreference = 'Stop';
Write-Host Starting build

if ($isWindows) {
  docker build --pull -t alpine-panstamp -f Dockerfile.windows .
} else {
  docker build -t alpine-panstamp --build-arg "arch=$env:ARCH" --build-arg USER_ID=999 --build-arg GROUP_ID=998 .
}

docker images
