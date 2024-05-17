class AppStrings {
  //Recursos de strings para utilizar en la aplicacion y no andar acmbiando de archivo en archivo, aca puedes ver como se crean las strings
  //Para usar los strings simplemente escribe: AppStrings y el autocompletador importara la clase automaticamente

  static const bienvenido = 'Bienvenido de vuelta a nuestra aplicación';
  static const iniciarSesion = 'Iniciar sesión';
  static const crearCuenta = "Creación de cuenta";
  static const saludoInicial = "Gracias por elegirnos";
  // Agrega todas las demás cadenas de texto que necesites aquí

  //Pantallas de SignIn y SignUp, es decir, el login
  static const login = "Inicio de Sesión";

  static const hintEmail = "Indique su Email";
  static const hintPassword = "Contraseña";

  static const btnLogin = "Entrar";
  static const loginMethods = "Otros metodos de inicio de sesión";

  static const FacebookLogin = "Facebook";
  static const GoogleLogin = "Google";

  static const toSignUpMessage = "¿No tienes una cuenta?";
  static const toSignUp = "Crear una cuenta";

  //Mensaje de error
  static const emailAlreadyInUse = "El email ya está en uso";
  static const passwordToWeak = "La contraseña es demasiado debil";
  static const formNotNull =
      "Los campos de usuario y contraseña no pueden ser nulos";
  static const userOrEmailFail = "Usuario o contraseña incorrecto";
}
