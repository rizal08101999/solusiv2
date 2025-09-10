import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/task/model/task_model.dart';

class TaskController extends GetxController {
  final currentindex = 0.obs;
  final scrollfilterC = ScrollController();
  final listtask = RxList<TaskModel>();
  final listtask2 = RxList<TaskModel>();
  final loading = false.obs;
  final loadingfilter = false.obs;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    loading.value = true;
    List<TaskModel> dummyTasks = [
      // My Task - 4 item
      TaskModel(
        title: "Distribusi Ekstra",
        description: "Maintenance produk di gudang",
        tanggal: DateTime(2024, 10, 3, 8, 0),
        deadline: DateTime(2024, 10, 31, 17, 0),
        tipe: "Urgent",
        pemberiTugas: "Achmad Badawi",
        status: TaskStatus.belumDiambil,
        isMyTask: true,
        isCreatedByMe: false,
        catatan: "Belum ada progress",
      ),
      TaskModel(
        title: "Pengiriman Cabang",
        description: "Pengiriman barang ke cabang Surabaya",
        tanggal: DateTime(2024, 9, 25, 8, 0),
        deadline: DateTime(2024, 9, 30, 17, 0),
        tipe: "Normal",
        pemberiTugas: "Budi Santoso",
        status: TaskStatus.onProgress,
        isMyTask: true,
        isCreatedByMe: false,
        tanggalProgress: DateTime(2024, 9, 27, 14, 0),
        catatan: "Barang sedang dalam perjalanan",
      ),
      TaskModel(
        title: "Pemeriksaan Kendaraan",
        description: "Pemeriksaan rutin armada distribusi",
        tanggal: DateTime(2024, 9, 10, 8, 0),
        deadline: DateTime(2024, 9, 12, 17, 0),
        tipe: "Low",
        pemberiTugas: "Indra Wijaya",
        status: TaskStatus.selesai,
        isMyTask: true,
        isCreatedByMe: false,
        tanggalProgress: DateTime(2024, 9, 10, 14, 0),
        tanggalSelesai: DateTime(2024, 9, 11, 16, 30),
        catatan: "Selesai sesuai jadwal",
      ),
      TaskModel(
        title: "Penggantian Rak Gudang",
        description: "Penggantian rak besi lama",
        tanggal: DateTime(2024, 8, 20, 8, 0),
        deadline: DateTime(2024, 8, 25, 17, 0),
        tipe: "Urgent",
        pemberiTugas: "Ahmad Prasetyo",
        status: TaskStatus.dibatalkan,
        isMyTask: true,
        isCreatedByMe: false,
        tanggalProgress: DateTime(2024, 8, 21, 14, 0),
        tanggalBatal: DateTime(2024, 8, 22, 10, 0),
        catatan: "Dibatalkan karena anggaran",
      ),

      // Selesai - total 3 item (1 sudah ada di atas dari My Task)
      TaskModel(
        title: "Pengecekan Stok",
        description: "Audit stok bulanan",
        tanggal: DateTime(2024, 9, 1, 8, 0),
        deadline: DateTime(2024, 9, 5, 17, 0),
        tipe: "Low",
        pemberiTugas: "Achmad Badawi",
        status: TaskStatus.selesai,
        isMyTask: false,
        isCreatedByMe: true,
        tanggalProgress: DateTime(2024, 9, 2, 14, 0),
        tanggalSelesai: DateTime(2024, 9, 4, 16, 30),
        catatan: "Selesai lebih cepat",
      ),
      TaskModel(
        title: "Pelatihan Karyawan",
        description: "Training gudang batch 2",
        tanggal: DateTime(2024, 7, 15, 8, 0),
        deadline: DateTime(2024, 7, 16, 17, 0),
        tipe: "Normal",
        pemberiTugas: "Rina Andriani",
        status: TaskStatus.selesai,
        isMyTask: false,
        isCreatedByMe: false,
        tanggalProgress: DateTime(2024, 7, 15, 14, 0),
        tanggalSelesai: DateTime(2024, 7, 16, 16, 30),
        catatan: "Peserta lengkap",
      ),

      // Dibatalkan - total 3 item (1 sudah ada di atas dari My Task)
      TaskModel(
        title: "Perbaikan Sistem",
        description: "Update software gudang",
        tanggal: DateTime(2024, 8, 15, 8, 0),
        deadline: DateTime(2024, 8, 20, 17, 0),
        tipe: "Urgent",
        pemberiTugas: "Achmad Badawi",
        status: TaskStatus.dibatalkan,
        isMyTask: false,
        isCreatedByMe: true,
        tanggalProgress: DateTime(2024, 8, 16, 14, 0),
        tanggalBatal: DateTime(2024, 8, 18, 10, 0),
        catatan: "Vendor gagal menyediakan update",
      ),
      TaskModel(
        title: "Pembersihan Gudang Lama",
        description: "Membersihkan gudang Cikarang",
        tanggal: DateTime(2024, 6, 10, 8, 0),
        deadline: DateTime(2024, 6, 12, 17, 0),
        tipe: "Low",
        pemberiTugas: "Eka Putri",
        status: TaskStatus.dibatalkan,
        isMyTask: false,
        isCreatedByMe: false,
        tanggalProgress: DateTime(2024, 6, 11, 14, 0),
        tanggalBatal: DateTime(2024, 6, 11, 10, 0),
        catatan: "Dibatalkan karena gudang dijual",
      ),

      // Pembuat Tugas - total 3 item (2 sudah ada di atas)
      TaskModel(
        title: "Pengadaan Alat Baru",
        description: "Pembelian forklift baru",
        tanggal: DateTime(2024, 5, 1, 8, 0),
        deadline: DateTime(2024, 5, 10, 17, 0),
        tipe: "Urgent",
        pemberiTugas: "Achmad Badawi",
        status: TaskStatus.onProgress,
        isMyTask: false,
        isCreatedByMe: true,
        tanggalProgress: DateTime(2024, 5, 5, 14, 0),
        catatan: "Proses procurement",
      ),
    ];
    listtask.addAll(dummyTasks);
    listtask2.addAll(dummyTasks);
    await Future.delayed(Duration(milliseconds: 1500));
    loading.value = false;
  }

  void selectIndex(int index, String status, ) async {
    loadingfilter.value = true;
    listtask.clear();
    if (index != 0) {
      if (status != "") {
        final foundedItem = listtask2.where((p0) => p0.status.name == status).toList();
        listtask.addAll(foundedItem,);
      } else {
        final foundedItem = listtask2.where((p0) => p0.isMyTask == true).toList();
        debugPrint("foundedItem ${foundedItem.length}");
        listtask.addAll(foundedItem,);
      }
    } else {
      listtask.addAll(listtask2,);
    }
    currentindex.value = index;
    scrollToSelectedFilter(index);
    await Future.delayed(Duration(milliseconds: 500));
    loadingfilter.value = false;
  }

  void scrollToSelectedFilter(int index) {
    final context = Get.context!;
    double screenWidth = MediaQuery.of(context).size.width;
    double targetPosition = index * 150.0; // Sesuaikan ukuran item filter jika berbeda
    scrollfilterC.animateTo(
      index == 0 ? 0 : targetPosition - screenWidth / 2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
