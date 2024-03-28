import 'package:daylio/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});
  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              TTexts.editPersonalDetails,
              style: TextStyle(
                fontSize: TSizes.fontSizeLg,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
              validator: TValidator.validateName,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              validator: TValidator.validateName,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: TValidator.validatePassword,
              obscureText: true,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('First Name: ${firstNameController.text}');
                  print('Last Name: ${lastNameController.text}');
                  print('Password: ${passwordController.text}');
                }
              },
              child: const Text(TTexts.save),
            ),
          ],
        ),
      ),
    );
  }
}
