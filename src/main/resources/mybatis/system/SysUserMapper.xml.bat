<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="SysUserMapper">
  <resultMap id="BaseResultMap" type="com.jiajun.pojo.system.SysUserEntity">
    <id column="id" jdbcType="INTEGER" property="id" />
    <result column="username" jdbcType="VARCHAR" property="username" />
    <result column="password" jdbcType="VARCHAR" property="password" />
    <result column="name" jdbcType="VARCHAR" property="name" />
    <result column="login_time" jdbcType="TIMESTAMP" property="loginTime" />
    <result column="last_id" jdbcType="VARCHAR" property="lastId" />
    <result column="skin" jdbcType="VARCHAR" property="skin" />
    <result column="sort" jdbcType="INTEGER" property="sort" />
    <result column="phone" jdbcType="VARCHAR" property="phone" />
    <result column="email" jdbcType="VARCHAR" property="email" />
    <result column="status" jdbcType="SMALLINT" property="status" />
    <result column="remark" jdbcType="VARCHAR" property="remark" />
    <result column="gmt_create" jdbcType="TIMESTAMP" property="gmtCreate" />
    <result column="gmt_modified" jdbcType="TIMESTAMP" property="gmtModified" />
  </resultMap>
  
  <resultMap id="hasRoleResultMap" type="com.jiajun.pojo.system.SysUserEntity" extends="BaseResultMap">
  	<!-- 级联查询 -->
	<collection property="roleList" ofType="com.jiajun.pojo.system.SysRoleEntity" column="id" select="SysRoleMapper.selectByUserId"/>
  </resultMap>
  
  <sql id="Base_Column_List">
    id, username, password, name, login_time, last_id, skin, sort, phone, email, status, 
    remark, gmt_create, gmt_modified
  </sql>
  
  <select id="getUserNumByRole" parameterType="int" resultType="int">
	SELECT
		COUNT(*)
	FROM
		SYS_USER,
		SYS_USER_ROLE
	WHERE
		SYS_USER.ID = SYS_USER_ROLE.USER_ID
	AND SYS_USER_ROLE.ROLE_ID = #{roleId}
  </select>
  
  <select id="getNumByEmail" resultType="int" parameterType="params">
  	select count(*) from sys_user where id != #{id,jdbcType=INTEGER} and email = #{email, jdbcType=VARCHAR}
  </select>
  
  <select id="getCount" parameterType="params" resultType="Integer">
  	select 
  		count(*) 
  		from sys_user t1
	<include refid="condiction"/>
  </select>
  
 <sql id="condiction">
   	<where>
  	 	<!-- 排除掉系统管理员 -->
  		id != 1
		<if test="keyword != null and keyword != ''">
			and 
		    (
		    	t1.username like concat('%', #{keyword}, '%')
				or t1.name like concat('%', #{keyword}, '%')
				or t1.phone like concat(#{keyword}, '%')
				or t1.email like concat(#{keyword}, '%')
			)
		</if>
		<if test="beginTime != null and beginTime != ''">
			and t1.login_time &gt;= str_to_date(#{beginTime}, '%Y-%m-%d')
		</if>
		<if test="endTime != null and endTime != ''">
			and t1.login_time &lt;=  str_to_date(#{endTime}, '%Y-%m-%d')
		</if>
		<if test="roleId != null and roleId != ''">
			and exists (select * from sys_user_role t2 where t2.user_id = t1.id and t2.role_id = #{roleId})
		</if>
  	</where>
 </sql>
 
  <select id="getList" parameterType="params" resultMap="hasRoleResultMap">
  	select 
  		<include refid="Base_Column_List"/>
  		from sys_user t1
  	<include refid="condiction"/>
  		limit #{begin}, #{rows}
  </select>
  
  <select id="selectByNameAndPwd" resultMap="BaseResultMap" parameterType="params">
    select 
    <include refid="Base_Column_List" />
    from sys_user
    where username = #{username,jdbcType=VARCHAR} and password = #{password, jdbcType=VARCHAR}
  </select>
  
  <select id="selectByPrimaryKey" parameterType="java.lang.Integer" resultMap="BaseResultMap">
    select 
    <include refid="Base_Column_List" />
    from sys_user
    where id = #{id,jdbcType=INTEGER}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
    delete from sys_user
    where id = #{id,jdbcType=INTEGER}
  </delete>
  <insert id="insert" parameterType="com.jiajun.pojo.system.SysUserEntity">
    insert into sys_user (id, username, password, 
      name, login_time, last_id, 
      skin, sort, phone, 
      email, status, remark, 
      gmt_create, gmt_modified)
    values (#{id,jdbcType=INTEGER}, #{username,jdbcType=VARCHAR}, #{password,jdbcType=VARCHAR}, 
      #{name,jdbcType=VARCHAR}, #{loginTime,jdbcType=TIMESTAMP}, #{lastId,jdbcType=VARCHAR}, 
      #{skin,jdbcType=VARCHAR}, #{sort,jdbcType=INTEGER}, #{phone,jdbcType=VARCHAR}, 
      #{email,jdbcType=VARCHAR}, #{status,jdbcType=SMALLINT}, #{remark,jdbcType=VARCHAR}, 
      #{gmtCreate,jdbcType=TIMESTAMP}, #{gmtModified,jdbcType=TIMESTAMP})
  </insert>
  <insert id="insertSelective" parameterType="com.jiajun.pojo.system.SysUserEntity">
    insert into sys_user
    <trim prefix="(" suffix=")" suffixOverrides=",">
      <if test="id != null">
        id,
      </if>
      <if test="username != null">
        username,
      </if>
      <if test="password != null">
        password,
      </if>
      <if test="name != null">
        name,
      </if>
      <if test="loginTime != null">
        login_time,
      </if>
      <if test="lastId != null">
        last_id,
      </if>
      <if test="skin != null">
        skin,
      </if>
      <if test="sort != null">
        sort,
      </if>
      <if test="phone != null">
        phone,
      </if>
      <if test="email != null">
        email,
      </if>
      <if test="status != null">
        status,
      </if>
      <if test="remark != null">
        remark,
      </if>
      <if test="gmtCreate != null">
        gmt_create,
      </if>
      <if test="gmtModified != null">
        gmt_modified,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
      <if test="id != null">
        #{id,jdbcType=INTEGER},
      </if>
      <if test="username != null">
        #{username,jdbcType=VARCHAR},
      </if>
      <if test="password != null">
        #{password,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        #{name,jdbcType=VARCHAR},
      </if>
      <if test="loginTime != null">
        #{loginTime,jdbcType=TIMESTAMP},
      </if>
      <if test="lastId != null">
        #{lastId,jdbcType=VARCHAR},
      </if>
      <if test="skin != null">
        #{skin,jdbcType=VARCHAR},
      </if>
      <if test="sort != null">
        #{sort,jdbcType=INTEGER},
      </if>
      <if test="phone != null">
        #{phone,jdbcType=VARCHAR},
      </if>
      <if test="email != null">
        #{email,jdbcType=VARCHAR},
      </if>
      <if test="status != null">
        #{status,jdbcType=SMALLINT},
      </if>
      <if test="remark != null">
        #{remark,jdbcType=VARCHAR},
      </if>
      <if test="gmtCreate != null">
        #{gmtCreate,jdbcType=TIMESTAMP},
      </if>
      <if test="gmtModified != null">
        #{gmtModified,jdbcType=TIMESTAMP},
      </if>
    </trim>
  </insert>
  <update id="updateByPrimaryKeySelective" parameterType="com.jiajun.pojo.system.SysUserEntity">
    update sys_user
    <set>
      <if test="username != null">
        username = #{username,jdbcType=VARCHAR},
      </if>
      <if test="password != null">
        password = #{password,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        name = #{name,jdbcType=VARCHAR},
      </if>
      <if test="loginTime != null">
        login_time = #{loginTime,jdbcType=TIMESTAMP},
      </if>
      <if test="lastId != null">
        last_id = #{lastId,jdbcType=VARCHAR},
      </if>
      <if test="skin != null">
        skin = #{skin,jdbcType=VARCHAR},
      </if>
      <if test="sort != null">
        sort = #{sort,jdbcType=INTEGER},
      </if>
      <if test="phone != null">
        phone = #{phone,jdbcType=VARCHAR},
      </if>
      <if test="email != null">
        email = #{email,jdbcType=VARCHAR},
      </if>
      <if test="status != null">
        status = #{status,jdbcType=SMALLINT},
      </if>
      <if test="remark != null">
        remark = #{remark,jdbcType=VARCHAR},
      </if>
      <if test="gmtCreate != null">
        gmt_create = #{gmtCreate,jdbcType=TIMESTAMP},
      </if>
      <if test="gmtModified != null">
        gmt_modified = #{gmtModified,jdbcType=TIMESTAMP},
      </if>
    </set>
    where id = #{id,jdbcType=INTEGER}
  </update>
  <update id="updateByPrimaryKey" parameterType="com.jiajun.pojo.system.SysUserEntity">
    update sys_user
    set username = #{username,jdbcType=VARCHAR},
      password = #{password,jdbcType=VARCHAR},
      name = #{name,jdbcType=VARCHAR},
      login_time = #{loginTime,jdbcType=TIMESTAMP},
      last_id = #{lastId,jdbcType=VARCHAR},
      skin = #{skin,jdbcType=VARCHAR},
      sort = #{sort,jdbcType=INTEGER},
      phone = #{phone,jdbcType=VARCHAR},
      email = #{email,jdbcType=VARCHAR},
      status = #{status,jdbcType=SMALLINT},
      remark = #{remark,jdbcType=VARCHAR},
      gmt_create = #{gmtCreate,jdbcType=TIMESTAMP},
      gmt_modified = #{gmtModified,jdbcType=TIMESTAMP}
    where id = #{id,jdbcType=INTEGER}
  </update>
</mapper>