/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoyproduction;

/**
 *
 * @author PRATAMA
 */
import java.sql.*;
import java.io.*;

public class evoyproduction {   
    
    static String user="root";
    static String pwd="";
    static String host="localhost";
    static String db="evoyproduction";
    static String urlValue="";
    static BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    static PreparedStatement pStatement = null;
    static Connection conn;
    static ResultSet rs;
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            urlValue="jdbc:mysql://"+host+"/"+db+"?user="+user+"&password="+pwd;
            
            conn=DriverManager.getConnection(urlValue);
            System.out.println("Koneksi Sukses");
              
            if (!conn.isClosed()) {
                showMenu();   
            }
            
            conn.close(); 
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
    
    static void showMenu() {
        System.out.println("\n============== MENU UTAMA =========== ");
        System.out.println("1. Tambah Data");
        System.out.println("2. Tampilkan Data");
        System.out.println("3. Ubah Data");
        System.out.println("4. Hapus Data");
        System.out.println("0. Keluar");
        System.out.println("");
        System.out.print("Pilihan Anda : ");
        
        try {
            int pilihan = Integer.parseInt(input.readLine());
         
            switch(pilihan) {
                case 0:
                    System.exit(0);
                    break;
                case 1: 
                    menuTampilData();
                    break;
                default:
                    System.out.println("Pilihan salah");
                    clrscr();
                    showMenu();
            }
             
        }
        catch(IOException e) {
            e.printStackTrace();
        }
    }  
    
    static void menuTampilData() {
        System.out.format("=====================================%n");
        System.out.format("|          SEWA BAJU ADAT           |%n");
        System.out.format("|         EVOY PRODUCTION           |%n");
        System.out.format("=====================================%n");
        System.out.println("|   1. Tampilkan Data Kostum        |");
        System.out.println("|   2. Tampilkan Data Pelanggan     |");
        System.out.println("|   3. Ubah Data                    |");
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
                    tampilDataKostum();
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
    
    static void tampilDataKostum() {
        evoyproduction.clrscr();
        String sql = "SELECT * FROM kostum";
        try {
             
            pStatement= conn.prepareStatement(sql);
            rs = pStatement.executeQuery();

            String tbl = "| %-11s | %-19s | %-6d | %-13d | %n";

            System.out.format("==============================================================%n");
            System.out.format("|                  Data Kostum Evoy Production               | %n");
            System.out.format("+=============+=====================+========+===============+%n");
            System.out.format("| Kode Kostum |     Nama Kostum     | Jumlah |     Harga     |%n");
            System.out.format("+=============+=====================+========+===============+%n");


            while(rs.next()) {

               String kodeKostum = rs.getString("kode_kostum");
               String namaKostum = rs.getString("nama_kostum");
               int jmlKostum = rs.getInt("jml_kostum");
               int hargaKostum = rs.getInt("harga");

               System.out.format(tbl, kodeKostum, namaKostum, jmlKostum, hargaKostum);
            }
            System.out.format("+=============+=====================+========+===============+%n");

            pStatement.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }  
    }
    
    static void tampilDataPelanggan() {
        evoyproduction.clrscr();
        String sql = "SELECT * FROM pelanggan";
        try {
             
            pStatement= conn.prepareStatement(sql);
            rs = pStatement.executeQuery();

            String tbl = "| %-11s | %-19s | %-6s | %-13s | %-15s | %-15s | %n";

            System.out.format("=====================================================================%n");
            System.out.format("|                      Data Kostum Evoy Production                  |%n");
            System.out.format("+==============+=============+==============+================+==========+=============+%n");
            System.out.format("| ID Pelanggan |     NIK     |     Nama     |     Alamat     |   Kota   |   No. Tlp   |%n");
            System.out.format("+==============+=============+==============+================+==========+=============+%n");


            while(rs.next()) {

               String idPelanggan = rs.getString("id_pelanggan");
               String NIK = rs.getString("NIK");
               String namaPelanggan = rs.getString("nama");
               String alamat = rs.getString("alamat");
               String kota = rs.getString("kota");
               String no_tlp = rs.getString("no_tlp");

               System.out.format(tbl, idPelanggan, NIK, namaPelanggan, alamat, kota, no_tlp);
            }
            System.out.format("+==============+=============+==============+================+==========+=============+%n");

            pStatement.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }  
    }
}
