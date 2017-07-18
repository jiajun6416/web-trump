package com.jiajun.dao.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiajun.dao.base.impl.DaoImpl;
import com.jiajun.pojo.ZtreeNode;

@Repository
public class MenuDaoImpl extends DaoImpl implements MenuDao{
	
	@Override
	public List<ZtreeNode> selectAllMenuZtreeNode() throws Exception {
		return getNodesByPid(this.getSqlSession(), "SysMenuMapper.selectMenuZtreeNodeById", 0);
	}
	private List<ZtreeNode> getNodesByPid(SqlSession session, String statement, int pId) {
		List<ZtreeNode> list = session.selectList(statement, pId);
		if(list != null) {
			for (ZtreeNode node : list) {
				if(node.getIsParent() == 1) {
					node.setNodes(this.getNodesByPid(session, statement, node.getId()));;
				}
			}
		}
		return list;
	}
}
