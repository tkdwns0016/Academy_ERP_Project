package position;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PositionMapper {
	@Select("select position_name from position where id=#{id}")
	public Position selectName(int id);
}
