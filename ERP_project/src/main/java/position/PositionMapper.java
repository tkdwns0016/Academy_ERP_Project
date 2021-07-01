package position;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PositionMapper {
 
	@Select("select position from position where position_id=#{positionId}")
	public String getName(int positionId);
}
