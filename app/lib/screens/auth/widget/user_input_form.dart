import 'package:flutter/material.dart';
import 'package:mcp_realm/mcp_realm.dart';
import '../../product_list_screen.dart';

class UserInputForm extends StatefulWidget {
  final McpRealmServices? realmService;
  final Members member;

  const UserInputForm(
      {super.key, required this.realmService, required this.member});

  @override
  State<UserInputForm> createState() => _UserInputFormState();
}

class _UserInputFormState extends State<UserInputForm> {
  final TextEditingController _nameController = TextEditingController();
  bool _acceptedTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildNameTextField(),
          buildTermsAndConditionsCheckbox(),
          buildFilledButton(widget.realmService, widget.member, context),
        ],
      ),
    );
  }

  Widget buildUserInputForm(
      McpRealmServices? realmService, Members member, BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              'Derniére étape',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          buildNameTextField(),
          buildTermsAndConditionsCheckbox(),
          buildFilledButton(realmService, member, context),
        ],
      ),
    );
  }

  Padding buildNameTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      child: TextField(
        controller: _nameController,
        decoration: const InputDecoration(
          hintText: 'Ton prénom',
        ),
      ),
    );
  }

  Padding buildTermsAndConditionsCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        children: [
          Checkbox(
              value: _acceptedTermsAndConditions,
              onChanged: (newValue) {
                setState(() {
                  _acceptedTermsAndConditions = newValue!;
                });
              }),
          const Flexible(
              child: Text(
                  "L'acceptation des Conditions Générales d'Utilisation (CGU).")),
        ],
      ),
    );
  }

  Padding buildFilledButton(realmService, member, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
      child: FilledButton(
        onPressed: () {
          realmService?.realm.write(() {
            member.name = _nameController.text;
            member.acceptedCGU = _acceptedTermsAndConditions;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductListScreen()),
          );
        },
        child: const Text(
          'Connexion',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
