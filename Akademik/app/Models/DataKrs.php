<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataKrs
 * 
 * @property int $krs_id
 * @property int|null $krs_mhs_id
 * @property int|null $krs_dtmakul_id
 * @property float|null $krs_nilai
 * @property Carbon|null $krs_created_at
 * @property Carbon|null $krs_updated_at
 * 
 * @property DataMatakuliah|null $data_matakuliah
 * @property MasterMahasiswa|null $master_mahasiswa
 * @property Collection|DataKelasDetail[] $data_kelas_details
 *
 * @package App\Models
 */
class DataKrs extends Model
{
	protected $table = 'data_krs';
	protected $primaryKey = 'krs_id';
	public $timestamps = false;

	protected $casts = [
		'krs_mhs_id' => 'int',
		'krs_dtmakul_id' => 'int',
		'krs_nilai' => 'float'
	];

	protected $dates = [
		'krs_created_at',
		'krs_updated_at'
	];

	protected $fillable = [
		'krs_mhs_id',
		'krs_dtmakul_id',
		'krs_nilai',
		'krs_created_at',
		'krs_updated_at'
	];

	public function data_matakuliah()
	{
		return $this->belongsTo(DataMatakuliah::class, 'krs_dtmakul_id');
	}

	public function master_mahasiswa()
	{
		return $this->belongsTo(MasterMahasiswa::class, 'krs_mhs_id');
	}

	public function data_kelas_details()
	{
		return $this->hasMany(DataKelasDetail::class, 'kdet_krs_id');
	}
}
