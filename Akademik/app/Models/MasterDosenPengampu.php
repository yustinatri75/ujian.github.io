<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterDosenPengampu
 * 
 * @property int $dp_id
 * @property int|null $dp_dosen_id
 * @property int|null $dp_makul_id
 * @property Carbon|null $dp_created_at
 * @property Carbon|null $dp_updated_at
 * 
 * @property MasterDosen|null $master_dosen
 * @property MasterMatakuliah|null $master_matakuliah
 *
 * @package App\Models
 */
class MasterDosenPengampu extends Model
{
	protected $table = 'master_dosen_pengampu';
	protected $primaryKey = 'dp_id';
	public $timestamps = false;

	protected $casts = [
		'dp_dosen_id' => 'int',
		'dp_makul_id' => 'int'
	];

	protected $dates = [
		'dp_created_at',
		'dp_updated_at'
	];

	protected $fillable = [
		'dp_dosen_id',
		'dp_makul_id',
		'dp_created_at',
		'dp_updated_at'
	];

	public function master_dosen()
	{
		return $this->belongsTo(MasterDosen::class, 'dp_dosen_id');
	}

	public function master_matakuliah()
	{
		return $this->belongsTo(MasterMatakuliah::class, 'dp_makul_id');
	}
}
