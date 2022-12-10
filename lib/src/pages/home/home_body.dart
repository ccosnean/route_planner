import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/pages/home/bloc/home_bloc.dart';
import 'package:route_planner/src/pages/home/bloc/home_event.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final formKey = GlobalKey<FormState>();
  HomeBloc? _bloc;
  String? origin = 'warsaw';
  String? destination = 'barcelona';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    _bloc ??= BlocProvider.of<HomeBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter city names",
              style: tt.titleLarge,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(Icons.gps_not_fixed),
                const SizedBox(width: 15),
                Expanded(
                  child: Material(
                    child: TextFormField(
                      initialValue: origin,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        origin = value;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z\s]*$')),
                      ],
                      decoration: const InputDecoration(
                        hintText: "from",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 15),
                Expanded(
                  child: Material(
                    child: TextFormField(
                      initialValue: destination,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        destination = value;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z\s]*$')),
                      ],
                      decoration: const InputDecoration(
                        hintText: "to",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            MaterialButton(
              color: cs.primary,
              onPressed: submitForm,
              child: Text(
                "Get route",
                style: TextStyle(color: cs.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      _bloc?.add(FormSubmitted(
        origin!,
        destination!,
      ));
    }
  }

  @override
  void dispose() {
    _bloc?.close();

    super.dispose();
  }
}
