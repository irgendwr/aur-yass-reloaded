# Maintainer: Jonas Bögle <aur@iwr.sh>

pkgname=yass-reloaded
pkgver=2025.2
pkgrel=1
pkgdesc="Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs"
arch=('i686' 'x86_64')
url="https://github.com/DoubleDee73/Yass"
license=('GPL')
depends=('jdk-openjdk>=23' 'java-openjfx>=23' 'gtk2' 'bash')
makedepends=('unzip')
_filename="Yass-Reloaded-${pkgver}.jar"
source=(
	"https://github.com/DoubleDee73/Yass/releases/download/${pkgver}/${_filename}"
	"${pkgname}.desktop"
	"${pkgname}.sh")
sha256sums=('75350234e4130ffaf98bd8a6371629f76f39d10a5f7d79a67da30dc333ec7e1e'
            '3302b96b565e374f6de96c7139407bf8ee7b4bc206405f7489ee2cb109a57382'
            'ff8f862b10b093c964bd572e13504c315ee6089eb1492de000ed2f3377b43f49')
options=(!strip)
noextract=("${_filename}")

package() {
	# jar
	install -Dm644 "${srcdir}/${_filename}" "${pkgdir}/usr/share/java/${pkgname}.jar"
	# icon
	unzip -j -d "${srcdir}" -o "${_filename}" yass/resources/icons/yass-icon.png
	install -Dm644 "${srcdir}/yass-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	# desktop
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# launch script
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
