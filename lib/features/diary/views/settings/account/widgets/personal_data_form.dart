import 'package:daylio/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import '../../../note/widget/firebase_storage_services.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});
  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String firstName = '';
  String lastName = '';

  @override
  void initState() {
    super.initState();
    _loadPersonalData();
  }

  Future<void> _loadPersonalData() async {
    final Storage storage = Storage();
    final loadedFirstName = await storage.getFirstName();
    final loadedLastName = await storage.getLastName();
    setState(() {
      firstName = loadedFirstName;
      lastName = loadedLastName;
      firstNameController.text = firstName;
      lastNameController.text = lastName;
    });
  }

  Future<void> _updateData() async {
    final Storage storage = Storage();
    final newFirstName = firstNameController.text;
    final newLastName = lastNameController.text;
    await storage.updateData(newFirstName, newLastName);
    await _loadPersonalData();
  }

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
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _updateData();
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
