# GoXLR Utility Build Script for PowerShell

Write-Host "Building GoXLR Utility Workspace..." -ForegroundColor Cyan

# Check if Cargo is installed
if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) {
    Write-Error "Cargo (Rust package manager / compiler toolchain) is not installed or not in PATH."
    exit 1
}

# Compile all workspace crates in release mode
cargo build --release --workspace

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build completed successfully!" -ForegroundColor Green
} else {
    Write-Error "Build failed with exit code $LASTEXITCODE."
    exit $LASTEXITCODE
}
