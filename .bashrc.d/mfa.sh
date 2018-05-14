function mfa () {
    oathtool --base32 --totp "$(gopass personal/$1)" | xclip -selection clipboard
}
