<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataMatakuliah
 * 
 * @property int $dtmakul_id
 * @property int $makul_id
 * @property Carbon $dtmakul_created_at
 * @property Carbon|null $dtmakul_updaated_at
 * 
 * @property MasterMatakuliah $master_matakuliah
 * @property Collection|DataKrs[] $data_krs
 *
 * @package App\Models
 */
class DataMatakuliah extends Model
{
	protected $table = 'data_matakuliah';
	protected $primaryKey = 'dtmakul_id';
	public $timestamps = false;

	protected $casts = [
		'makul_id' => 'int'
	];

	protected $dates = [
		'dtmakul_created_at',
		'dtmakul_updaated_at'
	];

	protected $fillable = [
		'makul_id',
		'dtmakul_created_at',
		'dtmakul_updaated_at'
	];

	public function master_matakuliah()
	{
		return $this->belongsTo(MasterMatakuliah::class, 'makul_id');
	}

	public function data_krs()
	{
		return $this->hasMany(DataKrs::class, 'krs_dtmakul_id');
	}
}
