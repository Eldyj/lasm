sudo cp lasm.lua /usr/bin/lasm
sudo chmod +x /usr/bin/lasm
mkdir -p ~/.lasm
cp -r lua ~/.lasm

if [ -z "$LASM_DIR" ]; then {
	echo 'now add LASM_DIR="$HOME/.lasm" yo your shell config for correct detecting includes'
}; fi
