import 'package:at_cliente_upds/data/categoria_data.dart';
import 'package:at_cliente_upds/screen/reporte_screen.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/show_toast.dart';
import 'package:at_cliente_upds/theme/style_icono.dart';
import 'package:at_cliente_upds/theme/style_text.dart';
import 'package:at_cliente_upds/widget/all_categoria_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _showLoginDialog(BuildContext context) {
    String? verifUser;
    String? verifPassword;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: const EdgeInsets.only(top: 10.0),
          scrollable: true,
          backgroundColor: blanco,
          title: const Center(
            child: StyleTextot(
              text: 'Iniciar sesión',
              colors: updsletras,
            ),
          ),
          content: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 5.0),
                const Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                const SizedBox(height: 10.0),
                _buildTextField(
                  labelText: 'Usuario',
                  icon: Icons.account_box,
                  onChanged: (value) {
                    verifUser = value;
                  },
                ),
                const SizedBox(height: 10.0),
                _buildTextField(
                  labelText: 'Contraseña',
                  icon: Icons.key,
                  obscureText: true,
                  onChanged: (value) {
                    verifPassword = value;
                  },
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    if (verifUser == 'Upds' && verifPassword == '12345') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReporteScreen(),
                        ),
                      );
                    } else {
                      showToastMessage(context, 'Datos Incorrectos');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: const BoxDecoration(
                      color: upds,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: updsletras,
          ),
        ),
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Image(
          image: AssetImage('assets/logo_upds.png'),
          width: 100,
        ),
        bottom: PreferredSize(
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyleTextot(
                  colors: updsletras,
                  text: 'SATISFACCIÓN DEL CLIENTE',
                  fontweight: FontWeight.bold,
                  size: 30,
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(
            orientation == Orientation.landscape ? 40 : 70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showLoginDialog(context),
            icon: const StyleIcono(
              iconName: 'login',
              color: negro,
              ancho: 35,
              alto: 35,
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [blanco, updsbarra],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: blanco,
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.scaleDown,
            opacity: 0.2,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 2,
                  childAspectRatio:
                      orientation == Orientation.portrait ? 10 / 3 : 3 / 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                ),
                children: categorias
                    .map(
                      (category) => AllCategoryWidget(categoria: category),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
