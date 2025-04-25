import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //con este obtenemos todo el estado del formulario
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>(); //se crea un llave con el GlobalKey con el tipo de llave, en este caso el del formulario: formState

    final Map<String, String> formValues = {
      'first_name': 'Miguel',
      'last_name': 'Herrera',
      'email': 'migueleonrojas@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs y Forms'),
        ),
        body: SingleChildScrollView(
          //se coloca este widget para contener un formulario ya que aparecera el teclado digital que ocupa espacio, y queremos que se pueda hacer scroll en el contenido
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              //widget para envolver los inputs
              key: myFormKey,
              child: Column(
                children: [
                  CustomInputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre del usuario',
                    formProperty: 'first_name',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Apellido',
                    hintText: 'Apellido del usuario',
                    formProperty: 'last_name',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Correo',
                    hintText: 'Correo del usuario',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña del usuario',
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField<String>(
                    //para indicar el tipo de dato va a fluir en nuestro "DropdownButtonFormField"
                    value: 'Admin',
                    items: const [
                      DropdownMenuItem( value: 'Admin', child: Text('Admin')),
                      DropdownMenuItem( value: 'Superuser', child: Text('Superuser')),
                      DropdownMenuItem( value: 'Superuser', child: Text('Superuser')),
                      DropdownMenuItem( value: 'Jr. Developer', child: Text('Jr. Developer')),

                    ],
                    onChanged: (value) {
                      print(value);
                      formValues['role'] = value ?? 'Admin';
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //para minimizar el teclado
                        FocusScope.of(context).requestFocus(FocusNode());

                        //validate: indica si el formulario es valido o no y dispara las validaciones de los inputs
                        if (!myFormKey.currentState!.validate()) {
                          print('Formulario no valido');
                          return;
                        }
                        //* imprimir valores del formulario
                        print(formValues);
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Guardar'))
                          )
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
