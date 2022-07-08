//Archivo para identificar el tamaño o tipo de pantalla

const _screenMobile = 600;
const _screenTablet = 840;

enum ScreenSize { small, medium, large }

//Screen.small
getScreenSize(double width) {
  if (width < _screenMobile) {
    return ScreenSize.small;
  } else if (width >= _screenMobile && width < _screenTablet) {
    return ScreenSize.medium;
  } else {
    return ScreenSize.large;
  }
}
