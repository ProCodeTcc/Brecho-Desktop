package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.banco.Conexao;
import br.senai.sp.model.AdicionarContasPagar;
import br.senai.sp.model.ContasPagar;

public class ContasPagarDAO {

	public static ContasPagarDAO instance;

	public void salvarConta(AdicionarContasPagar conta){
		String sql = "INSERT INTO despesas (nome,dataVencimento,valor,idConta) VALUES (?,?,?,1) ";

		try {
			PreparedStatement stm = Conexao.getConexao().prepareStatement(sql);
			stm.setString(1, conta.getDespesas());
			stm.setString(2, conta.getVencimento());
			stm.setDouble(3, conta.getValor());
			stm.execute();

		} catch (Exception e) {

		}
	}

	public static ContasPagarDAO getInstance(){
		if(instance == null)
			instance = new ContasPagarDAO();
		return instance;
	}

	public ArrayList<ContasPagar> selectAll(){
		ArrayList contas = new ArrayList<>();
		String sql = "SELECT d.idDuplicataPagar, p.titulo,d.valorReal,d.dtVencimento,d.idConta FROM duplicatapagar as d INNER JOIN duplicataPagar_pedidocompra as r on d.idDuplicataPagar = r.idDuplicata INNER JOIN pedidocompra as p on p.idPedidoCompra = r.idPedidoCompra UNION ALL SELECT idDespesa,nome,valor,dataVencimento,idConta FROM despesas ORDER BY YEAR(dtVencimento) ASC, MONTH(dtVencimento) ASC, DAY(dtVencimento) ASC; ";

		PreparedStatement stm;

		try {
			stm = Conexao.getConexao().prepareStatement(sql);

			ResultSet rs = stm.executeQuery();

			while(rs.next()){
				Integer id = rs.getInt("idDuplicataPagar");
				String nome = rs.getString("titulo");
				String dataP = rs.getString("dtVencimento");
				String valor = rs.getString("valorReal");
				Integer idConta = rs.getInt("idConta");

				String dd = dataP.substring(8, 10);
				String mm = dataP.substring(5, 7);
				String yyy = dataP.substring(0, 4);

				String vencimento = dd + "/" + mm + "/" + yyy ;

				ContasPagar conta = new ContasPagar(id, nome, vencimento, idConta, valor);

				contas.add(conta);
			}
			
		} catch (Exception e) {

		}

		Conexao.fecharConexao();
		Conexao.fecharConexao();

		return contas;
	}


}
