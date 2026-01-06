import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/lead_model.dart';

class LeadsController extends GetxController {
  final _storage = GetStorage();
  final leads = <LeadModel>[].obs;
  final isLoading = false.obs;
  final selectedLead = Rx<LeadModel?>(null);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final sourceController = TextEditingController();
  final notesController = TextEditingController();
  final selectedStatus = Rx<LeadStatus>(LeadStatus.newLead);

  @override
  void onInit() {
    super.onInit();
    _loadLeads();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    sourceController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _loadLeads() {
    final List<dynamic>? storedLeads = _storage.read('leads');
    if (storedLeads != null) {
      leads.value = storedLeads
          .map((json) => LeadModel.fromJson(Map<String, dynamic>.from(json)))
          .toList();
    } else {
      _addSampleLeads();
    }
  }

  void _saveLeads() {
    _storage.write('leads', leads.map((lead) => lead.toJson()).toList());
  }

  void _addSampleLeads() {
    leads.addAll([
      LeadModel(
        name: 'Rahul Sharma',
        phone: '9876543210',
        email: 'rahul@example.com',
        source: 'Facebook',
        status: LeadStatus.interested,
        notes: 'Interested in starter package',
      ),
      LeadModel(
        name: 'Priya Patel',
        phone: '9876543211',
        email: 'priya@example.com',
        source: 'Referral',
        status: LeadStatus.contacted,
        notes: 'Follow up next week',
      ),
      LeadModel(
        name: 'Amit Kumar',
        phone: '9876543212',
        source: 'WhatsApp',
        status: LeadStatus.newLead,
      ),
    ]);
    _saveLeads();
  }

  Future<void> addLead() async {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      Get.snackbar('error'.tr, 'field_required'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));

    final newLead = LeadModel(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text.isEmpty ? null : emailController.text,
      source: sourceController.text.isEmpty ? null : sourceController.text,
      status: selectedStatus.value,
      notes: notesController.text.isEmpty ? null : notesController.text,
    );

    leads.insert(0, newLead);
    _saveLeads();

    _clearForm();
    isLoading.value = false;

    Get.back();
    Get.snackbar('success'.tr, 'lead_added'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> updateLead() async {
    if (selectedLead.value == null) return;
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      Get.snackbar('error'.tr, 'field_required'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));

    final updatedLead = selectedLead.value!.copyWith(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text.isEmpty ? null : emailController.text,
      source: sourceController.text.isEmpty ? null : sourceController.text,
      status: selectedStatus.value,
      notes: notesController.text.isEmpty ? null : notesController.text,
    );

    final index = leads.indexWhere((lead) => lead.id == selectedLead.value!.id);
    if (index != -1) {
      leads[index] = updatedLead;
      _saveLeads();
    }

    _clearForm();
    isLoading.value = false;

    Get.back();
    Get.snackbar('success'.tr, 'lead_updated'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> deleteLead(String leadId) async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: Text('delete'.tr),
        content: Text('confirm_delete_lead'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text('delete'.tr),
          ),
        ],
      ),
    );

    if (result == true) {
      leads.removeWhere((lead) => lead.id == leadId);
      _saveLeads();
      Get.back();
      Get.snackbar('success'.tr, 'lead_deleted'.tr, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void selectLeadForEdit(LeadModel lead) {
    selectedLead.value = lead;
    nameController.text = lead.name;
    phoneController.text = lead.phone;
    emailController.text = lead.email ?? '';
    sourceController.text = lead.source ?? '';
    notesController.text = lead.notes ?? '';
    selectedStatus.value = lead.status;
  }

  void selectLeadForView(LeadModel lead) {
    selectedLead.value = lead;
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    sourceController.clear();
    notesController.clear();
    selectedStatus.value = LeadStatus.newLead;
    selectedLead.value = null;
  }

  Future<void> refreshLeads() async {
    await Future.delayed(const Duration(seconds: 1));
    _loadLeads();
  }
}
