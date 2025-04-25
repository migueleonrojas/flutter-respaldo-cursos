import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //widget de formulario
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      obscureText: obscureText,
      keyboardType:keyboardType, //para modificar los caracteres el teclado a mostrar, por ejemplo para que el teclado coloque los caracteres que facilite ingresar un correo
      onChanged: (value) {
        //obteniendo el valor de lo que se escribe
        formValues[formProperty] = value;
      },
      validator: (value) {
        //validaciones, si retorna un string es que hay un error en la validacion
        if (value == null) return 'Este Campo es requerido';

        return value.length < 3 ? 'Minimo de 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode
          .onUserInteraction, //para activar las validaciones, dependiendo de la accion que indiques en esta propiedad
      decoration: InputDecoration(
        //para decorar el input
        hintText: hintText, //es como un placeholder
        labelText: labelText, //es una etiqueta del input
        helperText: helperText, //ayuda para indicar el dato que se debe colocar en el input, y otros motivos adicionales
        counter: Text('3 caracteres'), //para indicar mas informacion. puedes indicar cuantos caracteres les queda o cuantos tienen escrito
        suffixIcon: suffixIcon == null ? null: Icon(suffixIcon), //icono que se coloca al final del input
        //prefixIcon: Icon(Icons.verified_user_outlined), //icono que se coloca al inicio del input
        icon: icon == null
            ? null
            : Icon(
                icon), //coloca un icono al principio del input pero al lado, achica el input, se coloca la condicion ya que si no se manda algo se va a usar un espacio para el icono pero sin icono alguno
        /* focusedBorder: OutlineInputBorder(//cambiar el color de los bordes cuando el input tiene el foco
          borderSide: BorderSide(
            color: Colors.green
          ),
        ),
        border:  OutlineInputBorder(//coloca un bordeado por todo el input
          borderRadius: BorderRadius.only(//indicar el redondeado de las esquinas
            bottomLeft:Radius.circular(10),
            topRight: Radius.circular(10),

          )
        ) */
      ),
    );
  }
}
