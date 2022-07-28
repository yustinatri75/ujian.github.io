<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataKelas
 * 
 * @property int $kelas_id
 * @property int|null $kelas_dosen_id
 * @property string|null $kelas_nama
 * @property Carbon|null $kelas_created_at
 * @property Carbon|null $kelas_updated_at
 * 
 * @property MasterDosen|null $master_dosen
 * @property Collection|DataKelasDetail[] $data_kelas_details
 *
 * @package App\Models
 */
class DataKelas extends Model
{
	protected $table = 'data_kelas';
	protected $primaryKey = 'kelas_id';
	public $timestamps = false;

	protected $casts = [
		'kelas_dosen_id' => 'int'
	];

	protected $dates = [
		'kelas_created_at',
		'kelas_updated_at'
	];

	protected $fillable = [
		'kelas_dosen_id',
		'kelas_nama',
		'kelas_created_at',
		'kelas_updated_at'
	];

	public function master_dosen()
	{
		return $this->belongsTo(MasterDosen::class, 'kelas_dosen_id');
	}

	public function data_kelas_details()
	{
		return $this->hasMany(DataKelasDetail::class, 'kdet_kelas_id');
	}
}
