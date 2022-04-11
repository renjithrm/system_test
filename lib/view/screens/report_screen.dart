import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/controller/controller.dart';
import 'package:student_app/controller/data_base_controller.dart';
import 'package:student_app/controller/get_user_controller.dart';
import 'package:student_app/model/database.dart';
import 'package:student_app/utils/const.dart';
import 'package:student_app/utils/enum.dart';

class ReportScreen extends StatefulWidget {
  Enum screen;

  List<DatabaseModel>? data;
  int? index;
  ReportScreen({Key? key, required this.screen, this.data, this.index})
      : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final discriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _controller = Get.find<Controller>();

  final _databaseController = Get.put(DataBaseController());

  final _getLocationController = Get.put(GetUserLocation());

  @override
  void initState() {
    if (widget.screen == Report.edit) {
      titleController.text = widget.data![widget.index!].title.toString();
      addressController.text == widget.data![widget.index!].address;
      phoneNumberController.text =
          widget.data![widget.index!].phoneNumber.toString();
      emailController.text = widget.data![widget.index!].email.toString();
      discriptionController.text =
          widget.data![widget.index!].discription.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Report",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: _size.width,
          height: _size.height,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  profileImage(),
                  columDiv(height: _size.height * 0.04),
                  form(
                      controller: titleController,
                      label: "Title",
                      prefixIcon: const Icon(Icons.title),
                      validator: requriedValidation),
                  columDiv(height: _size.height * 0.02),
                  form(
                      controller: addressController,
                      label: "Address",
                      prefixIcon: const Icon(Icons.edit),
                      validator: requriedValidation),
                  columDiv(height: _size.height * 0.02),
                  form(
                      controller: phoneNumberController,
                      label: "Phone Number",
                      prefixIcon: const Icon(Icons.call),
                      validator: requriedValidation,
                      keyboardType: TextInputType.number),
                  columDiv(height: _size.height * 0.02),
                  form(
                      controller: emailController,
                      label: "Email",
                      validator: MultiValidator([
                        requriedValidation,
                        EmailValidator(errorText: "Enter valied email address")
                      ]),
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress),
                  columDiv(height: _size.height * 0.02),
                  form(
                    controller: discriptionController,
                    label: "Add Discription",
                    maxLines: 8,
                    validator: requriedValidation,
                  ),
                  columDiv(height: _size.height * 0.03),
                  SizedBox(
                    width: _size.width * 0.6,
                    height: _size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (widget.screen == Report.add) {
                            await _databaseController.addData(
                                title: titleController.text,
                                address: addressController.text,
                                phoneNumber:
                                    int.parse(phoneNumberController.text),
                                email: emailController.text,
                                discription: discriptionController.text,
                                latitude:
                                    _getLocationController.position?.latitude,
                                longitude:
                                    _getLocationController.position?.longitude,
                                pic: Get.find<Controller>().profileImage);
                          } else {
                            await _databaseController.updateData(
                                title: titleController.text,
                                address: addressController.text,
                                phoneNumber:
                                    int.parse(phoneNumberController.text),
                                email: emailController.text,
                                discription: discriptionController.text,
                                latitude:
                                    _getLocationController.position?.latitude,
                                longitude:
                                    _getLocationController.position?.longitude,
                                pic: Get.find<Controller>().profileImage,
                                index: widget.index!);
                            Get.back();
                          }
                        } else {
                          print("nooo");
                        }
                        _controller.profileImage = null;
                        Get.back();
                      },
                      child: widget.screen == Report.add
                          ? const Text("submit")
                          : const Text("Edit"),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
