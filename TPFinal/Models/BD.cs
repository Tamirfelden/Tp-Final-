﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using TPFinal.Models;

namespace TPFinal.Models
{
    public static class BD
    {
        private static SqlConnection Conectar()
        {
            string SC = "Server =.; Database = Am Israel Defense Web; user id = alumno; password = alumno1;";
            SqlConnection Conex = new SqlConnection(SC);
            Conex.Open();
            return Conex;
        }
        private static void Desconectar(SqlConnection Conex)
        {
            Conex.Close();
        }
        public static List<TipoNoticias> TraerCategoria()
        {
            List<TipoNoticias> ListCategoria = new List<TipoNoticias>();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_TraerCategoria";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                int IdCategoria = Convert.ToInt32(dataReader["IdCategoria"]);
                string Nombre = Convert.ToString(dataReader["Nombre"]);
            }

            Conexion.Close();
            return ListCategoria;
        }


        public static List<Noticias> TraerNoticias()
        {
            List<Noticias> ListNoticias = new List<Noticias>();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_TraerNoticia";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                int IdNoticia = Convert.ToInt32(dataReader["IdNoticia"]);
                int fkCategoria = Convert.ToInt32(dataReader["fkCategoria"]);
                string Titulo = Convert.ToString(dataReader["Titulo"]);
                string Descripcion = Convert.ToString(dataReader["Descripcion"]);
                bool Destacado = Convert.ToBoolean(dataReader["Destacado"]);
                string Multimedia = Convert.ToString(dataReader["Multimedia"]);

            }

            Conexion.Close();
            return ListNoticias;

        }

        public static void CrearUsuarios(Usuarios user)
        {
            
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_CrearUsuarios";
            Consulta.Parameters.AddWithValue("Nombre", user.Nombre);
            Consulta.Parameters.AddWithValue("Apellido", user.Apellido);
            Consulta.Parameters.AddWithValue("Email", user.Mail);
            Consulta.Parameters.AddWithValue("Contraseña", user.Clave);

            Consulta.ExecuteNonQuery();

            Conexion.Close();
        }

        public static bool ValidarUsuarios(Usuarios user)
        {
            bool Existe;
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            SqlCommand cmd = new SqlCommand("sp_VerificarUsuario", Conexion);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", user.Nombre);
            cmd.Parameters.AddWithValue("@Clave", user.Clave);

            SqlDataReader Lector = cmd.ExecuteReader();
            if(Lector.Read())
            {
                Existe = true;
            }
            else
            {
                Existe = false;
            }
            Desconectar(Conexion);
            return Existe;
        }
    }
}



