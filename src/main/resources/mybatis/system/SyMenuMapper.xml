<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="SysMenuMapper">
  <resultMap id="BaseResultMap" type="com.jiajun.pojo.system.SysMenuEntity">
    <id column="id" jdbcType="INTEGER" property="id" />
    <result column="menu_name" jdbcType="VARCHAR" property="menuName" />
    <result column="parent_id" jdbcType="INTEGER" property="parentId" />
    <result column="is_parent" jdbcType="BIT" property="isParent" />
    <result column="access_url" jdbcType="VARCHAR" property="accessUrl" />
    <result column="privilege_code" jdbcType="VARCHAR" property="privilegeCode" />
    <result column="sort" jdbcType="INTEGER" property="sort" />
    <result column="icon" jdbcType="VARCHAR" property="icon" />
    <result column="is_show" jdbcType="BIT" property="isShow" />
    <result column="gmt_create" jdbcType="TIMESTAMP" property="gmtCreate" />
    <result column="gmt_modifyed" jdbcType="TIMESTAMP" property="gmtModifyed" />
  </resultMap>
  <resultMap type="com.jiajun.pojo.ZtreeNode" id="menuZtreeNode">
  	<id column="id" property="id" jdbcType="INTEGER"/>
  	<result column="parent_id" property="pId" jdbcType="INTEGER"/>
  	<result column="is_parent" property="isParent" jdbcType="INTEGER"/>
  	<result column="menu_name" property="name" jdbcType="VARCHAR"/>
  
  </resultMap>
  <resultMap type="com.jiajun.pojo.ZtreeNode" id="checkedZtreeNode" extends="menuZtreeNode">
  	<result column="checked" jdbcType="BIT" property="checked" />
  </resultMap>
  
  <sql id="Base_Column_List">
    id, menu_name, parent_id, is_parent, access_url, privilege_code, sort, icon, is_show, 
    gmt_create, gmt_modifyed
  </sql>
  
  <select id="selectChildNum" parameterType="int" resultType="int">
	SELECT
		count(*)
	FROM
		sys_menu
	WHERE
		parent_id = #{id}
  </select>
  
  <select id="selectMenuIdByRoleType" parameterType="map" resultMap="checkedZtreeNode">
	SELECT
		id,
		menu_name NAME,
		parent_id pId,
		is_parent isParent,
	<choose>
		<when test="menuIds != null and menuIds.size()>0" >
		IF (
			id IN 
			<foreach collection="menuIds" item="menuId" open="(" close=")" separator=",">
				#{menuId}
			</foreach>
			,
			TRUE,
			FALSE
		) checked
		</when>
		<otherwise>
			false checked
		</otherwise>
	</choose>
	FROM
		sys_menu
	ORDER BY
		sort
  </select>
  
  <select id="selecRoleMenuNodes" parameterType="map" resultMap="checkedZtreeNode">
	SELECT
		id,
		menu_name NAME,
		parent_id pId,
		is_parent isParent,
	<choose>
		<when test="menuIds != null and menuIds.size()>0">
			IF (
			id IN 
			<foreach collection="menuIds" item="menuId" open="(" close=")" separator=",">
				#{menuId}
			</foreach>
			,
			TRUE,
			FALSE
			) checked
		</when>
		<otherwise>
			false checked
		</otherwise>
	</choose>
	FROM
		sys_menu
	WHERE
		id IN 
		<foreach collection="typeMenuIds" item="typeId" open="(" close=")" separator=",">
			#{typeId}
		</foreach>
	ORDER BY
		sort ASC  	
  </select>
  
  <select id="selectMenuZtreeNodeList" resultMap="menuZtreeNode">
  	select id, menu_name name, parent_id pId, is_parent isParent from sys_menu order by sort asc
  </select>
  
  <select id="selectMenuByPid" parameterType="java.lang.Integer" resultMap="BaseResultMap">
  	select
  	<include refid="Base_Column_List"/>
  	from sys_menu where parent_id = #{pId} order by sort asc
  </select>
  
  <select id="selectByPrimaryKey" parameterType="java.lang.Integer" resultMap="BaseResultMap">
    select 
    <include refid="Base_Column_List" />
    from sys_menu
    where id = #{id,jdbcType=INTEGER} 
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
    delete from sys_menu
    where id = #{id,jdbcType=INTEGER}
  </delete>
  <insert id="insert" parameterType="com.jiajun.pojo.system.SysMenuEntity">
    insert into sys_menu (id, menu_name, parent_id, 
      is_parent, access_url, privilege_code, 
      sort, icon, is_show, gmt_create, 
      gmt_modifyed)
    values (#{id,jdbcType=INTEGER}, #{menuName,jdbcType=VARCHAR}, #{parentId,jdbcType=INTEGER}, 
      #{isParent,jdbcType=BIT}, #{accessUrl,jdbcType=VARCHAR}, #{privilegeCode,jdbcType=VARCHAR}, 
      #{sort,jdbcType=INTEGER}, #{icon,jdbcType=VARCHAR}, #{isShow,jdbcType=BIT}, #{gmtCreate,jdbcType=TIMESTAMP}, 
      #{gmtModifyed,jdbcType=TIMESTAMP})
  </insert>
  <insert id="insertSelective" parameterType="com.jiajun.pojo.system.SysMenuEntity">
    insert into sys_menu
    <trim prefix="(" suffix=")" suffixOverrides=",">
      <if test="id != null">
        id,
      </if>
      <if test="menuName != null">
        menu_name,
      </if>
      <if test="parentId != null">
        parent_id,
      </if>
      <if test="isParent != null">
        is_parent,
      </if>
      <if test="accessUrl != null">
        access_url,
      </if>
      <if test="privilegeCode != null">
        privilege_code,
      </if>
      <if test="sort != null">
        sort,
      </if>
      <if test="icon != null">
        icon,
      </if>
      <if test="isShow != null">
        is_show,
      </if>
      <if test="gmtCreate != null">
        gmt_create,
      </if>
      <if test="gmtModifyed != null">
        gmt_modifyed,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
      <if test="id != null">
        #{id,jdbcType=INTEGER},
      </if>
      <if test="menuName != null">
        #{menuName,jdbcType=VARCHAR},
      </if>
      <if test="parentId != null">
        #{parentId,jdbcType=INTEGER},
      </if>
      <if test="isParent != null">
        #{isParent,jdbcType=BIT},
      </if>
      <if test="accessUrl != null">
        #{accessUrl,jdbcType=VARCHAR},
      </if>
      <if test="privilegeCode != null">
        #{privilegeCode,jdbcType=VARCHAR},
      </if>
      <if test="sort != null">
        #{sort,jdbcType=INTEGER},
      </if>
      <if test="icon != null">
        #{icon,jdbcType=VARCHAR},
      </if>
      <if test="isShow != null">
        #{isShow,jdbcType=BIT},
      </if>
      <if test="gmtCreate != null">
        #{gmtCreate,jdbcType=TIMESTAMP},
      </if>
      <if test="gmtModifyed != null">
        #{gmtModifyed,jdbcType=TIMESTAMP},
      </if>
    </trim>
  </insert>
  <update id="updateByPrimaryKeySelective" parameterType="com.jiajun.pojo.system.SysMenuEntity">
    update sys_menu
    <set>
      <if test="menuName != null">
        menu_name = #{menuName,jdbcType=VARCHAR},
      </if>
      <if test="parentId != null">
        parent_id = #{parentId,jdbcType=INTEGER},
      </if>
      <if test="isParent != null">
        is_parent = #{isParent,jdbcType=BIT},
      </if>
      <if test="accessUrl != null">
        access_url = #{accessUrl,jdbcType=VARCHAR},
      </if>
      <if test="privilegeCode != null">
        privilege_code = #{privilegeCode,jdbcType=VARCHAR},
      </if>
      <if test="sort != null">
        sort = #{sort,jdbcType=INTEGER},
      </if>
      <if test="icon != null">
        icon = #{icon,jdbcType=VARCHAR},
      </if>
      <if test="isShow != null">
        is_show = #{isShow,jdbcType=BIT},
      </if>
      <if test="gmtCreate != null">
        gmt_create = #{gmtCreate,jdbcType=TIMESTAMP},
      </if>
      <if test="gmtModifyed != null">
        gmt_modifyed = #{gmtModifyed,jdbcType=TIMESTAMP},
      </if>
    </set>
    where id = #{id,jdbcType=INTEGER}
  </update>
  <update id="updateByPrimaryKey" parameterType="com.jiajun.pojo.system.SysMenuEntity">
    update sys_menu
    set menu_name = #{menuName,jdbcType=VARCHAR},
      parent_id = #{parentId,jdbcType=INTEGER},
      is_parent = #{isParent,jdbcType=BIT},
      access_url = #{accessUrl,jdbcType=VARCHAR},
      privilege_code = #{privilegeCode,jdbcType=VARCHAR},
      sort = #{sort,jdbcType=INTEGER},
      icon = #{icon,jdbcType=VARCHAR},
      is_show = #{isShow,jdbcType=BIT},
      gmt_create = #{gmtCreate,jdbcType=TIMESTAMP},
      gmt_modifyed = #{gmtModifyed,jdbcType=TIMESTAMP}
    where id = #{id,jdbcType=INTEGER}
  </update>
</mapper>