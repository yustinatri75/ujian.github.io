<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataKelasDetail
 * 
 * @property int $kdet_id
 * @property int|null $kdet_kelas_id
 * @property int|null $kdet_krs_id
 * @property Carbon|null $kdet_created_at
 * @property Carbon|null $kdet_updated_at
 * 
 * @property DataKelas|null $data_kelas
 * @property DataKrs|null $data_krs
 *
 * @package App\Models
 */
class DataKelasDetail extends Model
{
	protected $table = 'data_kelas_detail';
	protected $primaryKey = 'kdet_id';
	public $timestamps = false;

	protected $casts = [
		'kdet_kelas_id' => 'int',
		'kdet_krs_id' => 'int'
	];

	protected $dates = [
		'kdet_created_at',
		'kdet_updated_at'
	];

	protected $fillable = [
		'kdet_kelas_id',
		'kdet_krs_id',
		'kdet_created_at',
		'kdet_updated_at'
	];

	public function data_kelas()
	{
		return $this->belongsTo(DataKelas::class, 'kdet_kelas_id');
	}

	public function data_krs()
	{
		return $this->belongsTo(DataKrs::class, 'kdet_krs_id');
	}
}
