using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace BlogSite.Models
{
  public class Community
  {
    private int _id;
    private string _name;
    private string _description;
    

    public Community(string communityName, string communityDescription, int id = 0)
    {
      _name = communityName;
      _description = communityDescription;
      _id = id;
    }

    public string GetName()
    {
      return _name;
    }


     public string GetDescription()
    {
      return _description;
    }


    public int GetId()
    {
      return _id;
    }

    public override int GetHashCode()
    {
    return this.GetId().GetHashCode();
    }


    public override bool Equals(System.Object otherCommunity)
        {
        if (!(otherCommunity is Community))
            {
                return false;
            }
        else
            {
                Community newCommunity = (Community) otherCommunity;
                bool idEquality = this.GetId() == newCommunity.GetId();
                bool nameEquality = this.GetName() == newCommunity.GetName();
                bool descriptionEquality = this.GetDescription() == newCommunity.GetDescription();
                return (idEquality && nameEquality && descriptionEquality);
            }
        }
    

    public void Dispose()
    {
      Blog.ClearAll();
      Post.ClearAll();
      Community.ClearAll();
    }


    public void Save()
    {
        MySqlConnection conn = DB.Connection();
        conn.Open();

        var cmd = conn.CreateCommand() as MySqlCommand;
        cmd.CommandText = @"INSERT INTO communities (name, description) VALUES (@name, @description);";

        MySqlParameter name = new MySqlParameter();
        name.ParameterName = "@name";
        name.Value = this._name;
        cmd.Parameters.Add(name);

        MySqlParameter description = new MySqlParameter();
        description.ParameterName = "@description";
        description.Value = this._description;
        cmd.Parameters.Add(description);

        cmd.ExecuteNonQuery();
        _id = (int) cmd.LastInsertedId;
        conn.Close();
        if (conn != null)
            {
                conn.Dispose();
            }
    }


    public static List<Community> GetAll()
    {
      List<Community> allCommunities = new List<Community> {};
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM communities;";
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int CommunityId = rdr.GetInt32(0);
        string CommunityName = rdr.GetString(1);
        string CommunityDescription = rdr.GetString(2);
        Community newCommunity = new Community(CommunityName, CommunityDescription, CommunityId);
        allCommunities.Add(newCommunity);
      }
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return allCommunities;
    }


    public static Community Find(int id)
    {
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM communities WHERE id = (@searchId);";
      MySqlParameter searchId = new MySqlParameter();
      searchId.ParameterName = "@searchId";
      searchId.Value = id;
      cmd.Parameters.Add(searchId);
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      int CommunityId = 0;
      string CommunityName = "";
      string CommunityDescription = "";
      while(rdr.Read())
      {
        CommunityId = rdr.GetInt32(0);
        CommunityName = rdr.GetString(1);
        CommunityDescription = rdr.GetString(2);
      }
      Community newCommunity = new Community(CommunityName, CommunityDescription, CommunityId);
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return newCommunity;
    }


    public static void ClearAll()
    {
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"DELETE FROM communities;";
      cmd.ExecuteNonQuery();
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }


    public void Delete()
    {
        MySqlConnection conn = DB.Connection();
        conn.Open();
        MySqlCommand cmd = new MySqlCommand( "DELETE FROM communities WHERE id = @CommunityId;", conn);
        MySqlParameter communityIdParameter = new MySqlParameter();
        communityIdParameter.ParameterName = "@CommunityId";
        communityIdParameter.Value = this.GetId();
        cmd.Parameters.Add(communityIdParameter);
        cmd.ExecuteNonQuery();

        if (conn != null)
        {
            conn.Close();
        }
    }


    public void Edit(string newName, string newDescription)
        {
        MySqlConnection conn = DB.Connection();
        conn.Open();
        var cmd = conn.CreateCommand() as MySqlCommand;
        cmd.CommandText = @"UPDATE communities SET name = @newName, description = @newDescription WHERE id = (@searchId);";
        MySqlParameter searchId = new MySqlParameter();
        searchId.ParameterName = "@searchId";
        searchId.Value = _id;
        cmd.Parameters.Add(searchId);

        MySqlParameter name = new MySqlParameter();
        name.ParameterName = "@newName";
        name.Value = newName;
        cmd.Parameters.Add(name);

        MySqlParameter description = new MySqlParameter();
        description.ParameterName = "@newDescription";
        description.Value = newDescription;
        cmd.Parameters.Add(description);

        _name = newName;
        _description = newDescription;
        conn.Close();
        if (conn != null)
            {
                conn.Dispose();
            }
        }


  }
}