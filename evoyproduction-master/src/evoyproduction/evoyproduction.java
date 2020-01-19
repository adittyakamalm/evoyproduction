package evoyproduction;

import java.sql.*;
import java.io.*;

public class evoyproduction {   
    
    static String user = "root";
    static String pwd = "";
    static String host = "localhost";
    static String db = "evoyproduction";
    static String urlValue ="";
    static BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    static Statement statement;
    static Connection conn;;
    static ResultSet rs;
    
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            urlValue="jdbc:mysql://"+host+"/"+db+"?user="+user+"&password="+pwd;
            
            conn=DriverManager.getConnection(urlValue);
            statement = conn.createStatement();
            
            System.out.println("Koneksi Sukses");
              
            if (!conn.isClosed()) {
                showMenu();   
            }
            
            conn.close(); 
            statement.close();
        }
        catch (SQLException e)
        {
            System.out.println("Koneksi Gagal"+e.toString());
            
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("JDBC Driver tidak ditemukan");
        }       
    }
    
    //Method Clear Screen
    public static void clrscr() {  
        try {
            new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
        } 
        catch(Exception e) {
            System.out.println(e);
        }
    } 
    //Akhir method clear screen
    
    //Method menu utama
    static void showMenu() {
        System.out.format("=====================================%n");
        System.out.format("|          SEWA BAJU ADAT           |%n");
        System.out.format("|         EVOY PRODUCTION           |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Tambah Data                  |");
        System.out.println("|   2. Tampilkan Data               |");
        System.out.println("|   3. Ubah Data                    |");
        System.out.println("|   4. Cari Data                    |");
        System.out.println("|   5. Hapus Data                   |");
        System.out.println("|   0. Keluar                       |");
        System.out.format("=====================================%n");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
        
        try {
            int pilihan = Integer.parseInt(input.readLine());
         
            switch(pilihan) {
                case 0:
                    System.exit(0);
                    break;
                case 1: 
                    menuTambahData();
                    break;
                case 2:
                    menuTampilData();
                    break;
                case 3:
                    menuUbahData();
                    //break;
                case 4:
                    //menuCariData();
                    //brek;
                case 5:
                    menuHapusData();
                    //break;
                default:
                    System.out.println("Pilihan salah");
                    clrscr();
                    showMenu();
            }
        }
        catch(IOException e) {
            System.out.println(e);
        }
    }  
    //Akhir method menu utama
    
    //Method menu tampil data
    static void menuTampilData() {
        System.out.format("=====================================%n");
        System.out.format("|         EVOY PRODUCTION           |%n");
        System.out.format("|         MENU TAMPIL DATA          |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Tampilkan Data Kostum        |");
        System.out.println("|   2. Tampilkan Data Pelanggan     |");
        System.out.println("|   0. Keluar                       |");
        System.out.format("=====================================%n");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
        
        try {
            int pilihan = Integer.parseInt(input.readLine()); 
               
            switch(pilihan) {
                case 0:
                    System.exit(0);
                    break;
                case 1: 
                    tampilDataBaju();
                    break;      
                case 2:
                    tampilDataPelanggan();
                    break;
                default:
                    System.out.println("Pilihan salah");
            }
        }
        catch(IOException e) {
            e.printStackTrace();
        }
    }  
    //Akhir method menu tampil data
    
    //Method menampilkan data baju
    static void tampilDataBaju() {
        evoyproduction.clrscr();
        String sql = "SELECT * FROM baju";
        try {
             
            rs = statement.executeQuery(sql);

            String tbl = "| %-11s | %-19s | %-6d | %-13d | %n";

            System.out.format("=============================================================%n");
            System.out.format("|                   Data Baju Evoy Production                |%n");
            System.out.format("+=============+=====================+========+===============+%n");
            System.out.format("|  Kode Baju  |      Nama Baju      |  Stok  |     Harga     |%n");
            System.out.format("+=============+=====================+========+===============+%n");


            while(rs.next()) {

               String kodeBaju = rs.getString("kode_baju");
               String namaBaju = rs.getString("nama_baju");
               int stokBaju = rs.getInt("stok_baju");
               int hargaBaju = rs.getInt("harga");

               System.out.format(tbl, kodeBaju, namaBaju, stokBaju, hargaBaju);
            }
            System.out.format("+=============+=====================+========+===============+%n");
           
            statement.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }  
    }
    //Akhir method tampil data baju
    
    //Method menampilkan data pelanggan
    static void tampilDataPelanggan() {
        evoyproduction.clrscr();
        String sql = "SELECT * FROM pelanggan";
        
        try {     
            rs = statement.executeQuery(sql);

            String tbl ="| %-12s | %-12s | %-14s | %-8s | %-12s | %n";

            System.out.format("=====================================================================%n");
            System.out.format("|                   Data Pelanggan Evoy Production                  |%n");
            System.out.format("+==============+==============+==============+==========+===========+%n");
            System.out.format("| ID_Pelanggan |     Nama     |    Alamat    |   Kota   |  No. Tlp  |%n");
            System.out.format("+==============+==============+==============+==========+===========+%n");

            while(rs.next()) {

               String idPelanggan = rs.getString("id_pelanggan");
               String namaPelanggan = rs.getString("nama");
               String alamat = rs.getString("alamat");
               String kota = rs.getString("kota");
               String no_tlp = rs.getString("no_tlp");

               System.out.format(tbl, idPelanggan, namaPelanggan, alamat, kota, no_tlp);
            }
            System.out.format("+==============+==============+==============+==========+===========+%n");

            statement.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }  
    }
    //Akhir method tampilan data pelanggan
    
    
    //Menu tampilan menu tambah data
    static void menuTambahData() {
        System.out.format("=====================================%n");
        System.out.format("|         EVOY PRODUCTION           |%n");
        System.out.format("|         MENU TAMBAH DATA          |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Tambah Data Kostum           |");
        System.out.println("|   2. Tambah Data Pelanggan        |");
        System.out.println("|   0. Keluar                       |");
        System.out.format("=====================================%n");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
        
        try {
            int pilihan = Integer.parseInt(input.readLine());
            
            switch(pilihan) {
                case 0: 
                    System.exit(0);
                    break;
                case 1:
                    //tambahDataKostum();
                    break;
                case 2:
                    tambahDataPelanggan();
                    break;
                default:
                    System.out.println("Pilihan Salah! ");     
            }
            
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
    //Akhir method tampilan menu tambah data
    
    // Method tambah data pelanggan
    static void tambahDataPelanggan() {
        try { 
            System.out.print("ID_Pelanggan: ");
            String id_pelanggan = input.readLine();
              
            System.out.print("Nama : ");
            String nama = input.readLine();
            
            System.out.print("Alamat : ");
            String alamat = input.readLine();
            
            System.out.print("Kota : ");
            String kota = input.readLine();
            
            System.out.print("No. Tlp : ");
            String no_tlp = input.readLine();
            
            String sql = "INSERT INTO `evoyproduction`.`pelanggan` (`id_pelanggan`, `NIK`, `Nama`, `Alamat`, `kota`, `no_tlp`) "
                    + "VALUES ('%s', '%s', '%s', '%s', '%s');";
            sql = String.format(sql, id_pelanggan, nama, alamat, kota, no_tlp);
           
            statement.execute(sql);
                      
            
            int intBaris = statement.executeUpdate(sql);
                if ( intBaris > 0 ) {
                    System.out.println("Penambahan Data berhasil");
                }
                else {
                    System.out.println("Penambahan Data gagal");
                }
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
    // Method Menu ubah data 
    static void menuUbahData() 
    {
        System.out.format("=====================================%n");
        System.out.format("|          SEWA BAJU ADAT            |%n");
        System.out.format("|          EVOY PRODUCTION           |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Ubah Data baju               |");
        System.out.println("|   2. Ubah Data Pelanggan          |");
        System.out.println("|   0. Keluar                       |");
        System.out.format("=====================================%n");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
         try 
         {
            int pilihan = Integer.parseInt(input.readLine()); 
               
            switch(pilihan) 
            {
                case 0:
                    System.exit(0);
                    break;
                case 1: 
                    ubahDataBaju();
                    break;      
                case 2:
                    ubahDataPelanggan();
                    break;
                default:
                    System.out.println("Pilihan salah");
            }
        }
        catch(IOException e) 
            {
                e.printStackTrace();
            }
    }   
	// Akhir method menu ubah data
	
	// Method ubah data 1
    static void ubahDataBaju() 
    {
        try 
	{  
        // ambil input dari user
        System.out.print("Kode baju yang mau diedit: ");
        String kode_baju = input.readLine().trim();
        System.out.print("Nama baju : ");
        String nama_baju = input.readLine().trim();
        System.out.print("Jumlah : ");
        int stok_baju = Integer.parseInt(input.readLine());
        System.out.print("Harga : ");
        int harga = Integer.parseInt(input.readLine());

        // query update
        String sql = "UPDATE kostum SET nama_kostum='%s', jml_kostum=%d, harga=%d WHERE kode_kostum='%s'";
        sql = String.format(sql, nama_baju, stok_baju, harga, kode_baju);

        // update data kostum
        statement.execute(sql);
        } 
        catch (Exception e) 
            {
                e.printStackTrace();
            }
    }
	
    // Method ubah data 2
    static void ubahDataPelanggan()
    {
        try 
        {  
        // ambil input dari user
        System.out.print("ID Pelanggan yang mau diedit: ");
        String id_pelanggan = input.readLine().trim();
        System.out.print("Nama : ");
        String Nama= input.readLine().trim();
        System.out.print("Alamat : ");
        String Alamat = input.readLine().trim();
        System.out.print("Kota : ");
        String Kota = input.readLine().trim();
        System.out.print("No. Telp : ");
        String No_telp = input.readLine().trim();

        // query update
        String sql = "UPDATE pelanggan SET NIK='%s', Nama=%d, Alamat='%s', Kota='%s', No_telp='%s' WHERE id_pelanggan='%s'";
        sql = String.format(sql, Nama, Alamat, Kota, No_telp, id_pelanggan);

        // update data kostum
        statement.execute(sql);
        } 
        catch (Exception e) 
            {
                e.printStackTrace();
            }
    }
	
    // Method menu hapus data
    static void menuHapusData()
    {
        System.out.format("=====================================%n");
        System.out.format("|          SEWA BAJU ADAT            |%n");
        System.out.format("|          EVOY PRODUCTION           |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Hapus Data Baju              |");
        System.out.println("|   2. Hapus Data Pelanggan         |");
        System.out.println("|   0. Keluar                       |");
        System.out.format("=====================================%n");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
        try 
        {
            int pilihan = Integer.parseInt(input.readLine()); 
               
            switch(pilihan) {
                case 0:
                    System.exit(0);
                    break;
                case 1: 
                    hapusDataBaju();
                    break;      
                case 2:
                    hapusDataPelanggan();
                    break;
                default:
                    System.out.println("Pilihan salah");
            }
        }
        catch(IOException e) 
            {
                e.printStackTrace();
            }
    }
	
	// Method Hapus data 1
    static void hapusDataBaju()
    {
         try
         {
         // ambil input dari user
        System.out.print("Kode baju yang mau dihapus: ");
        String kode_baju = input.readLine().trim();
        
        // buat query hapus
        String sql = String.format("DELETE FROM kostum WHERE `kode_baju` ='%s'", kode_baju);
        // hapus data
        statement.execute(sql);
        
        System.out.println("Data telah terhapus...");
         } 
        catch (Exception e)
            {
                e.printStackTrace();
            }
    }
	  
    // Method Hapus data 2
    static void hapusDataPelanggan()
    {
         try 
         {
        // ambil input dari user
        System.out.print("ID Pelanggan yang mau dihapus: ");
        String id_pelanggan = input.readLine().trim();
        
        // buat query hapus
        String sql = String.format("DELETE FROM kostum WHERE `id_pelanggan` ='%s'", id_pelanggan);
        // hapus data
        statement.execute(sql);
        
        System.out.println("Data telah terhapus...");
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
