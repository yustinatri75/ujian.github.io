<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterMahasiswa
 * 
 * @property int $mhs_id
 * @property int $mhs_user_id
 * @property int $mhs_prodi_id
 * @property string $mhs_nama
 * @property int $mhs_tingkat
 * @property string $mhs_nim
 * @property Carbon $mhs_created_at
 * @property Carbon|null $mhs_updated_at
 * 
 * @property SysUser $sys_user
 * @property MasterProdi $master_prodi
 * @property Collection|DataKrs[] $data_krs
 *
 * @package App\Models
 */
class MasterMahasiswa extends Model
{
	protected $table = 'master_mahasiswa';
	protected $primaryKey = 'mhs_id';
	public $timestamps = false;

	protected $casts = [
		'mhs_user_id' => 'int',
		'mhs_prodi_id' => 'int',
		'mhs_tingkat' => 'int'
	];

	protected $dates = [
		'mhs_created_at',
		'mhs_updated_at'
	];

	protected $fillable = [
		'mhs_user_id',
		'mhs_prodi_id',
		'mhs_nama',
		'mhs_tingkat',
		'mhs_nim',
		'mhs_created_at',
		'mhs_updated_at'
	];

	public function sys_user()
	{
		return $this->belongsTo(SysUser::class, 'mhs_user_id');
	}

	public function master_prodi()
	{
		return $this->belongsTo(MasterProdi::class, 'mhs_prodi_id');
	}

	public function data_krs()
	{
		return $this->hasMany(DataKrs::class, 'krs_mhs_id');
	}
}
