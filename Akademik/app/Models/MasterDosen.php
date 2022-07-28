<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterDosen
 * 
 * @property int $dosen_id
 * @property int $dosen_user_id
 * @property int $dosen_prodi_id
 * @property string $dosen_nama
 * @property string $dosen_nik
 * @property string $dosen_kode
 * @property Carbon $dosen_created_at
 * @property Carbon|null $dosen_updated_at
 * 
 * @property MasterProdi $master_prodi
 * @property SysUser $sys_user
 * @property Collection|DataKelas[] $data_kelas
 * @property Collection|MasterDosenPengampu[] $master_dosen_pengampus
 *
 * @package App\Models
 */
class MasterDosen extends Model
{
	protected $table = 'master_dosen';
	protected $primaryKey = 'dosen_id';
	public $timestamps = false;

	protected $casts = [
		'dosen_user_id' => 'int',
		'dosen_prodi_id' => 'int'
	];

	protected $dates = [
		'dosen_created_at',
		'dosen_updated_at'
	];

	protected $fillable = [
		'dosen_user_id',
		'dosen_prodi_id',
		'dosen_nama',
		'dosen_nik',
		'dosen_kode',
		'dosen_created_at',
		'dosen_updated_at'
	];

	public function master_prodi()
	{
		return $this->belongsTo(MasterProdi::class, 'dosen_prodi_id');
	}

	public function sys_user()
	{
		return $this->belongsTo(SysUser::class, 'dosen_user_id');
	}

	public function data_kelas()
	{
		return $this->hasMany(DataKelas::class, 'kelas_dosen_id');
	}

	public function master_dosen_pengampus()
	{
		return $this->hasMany(MasterDosenPengampu::class, 'dp_dosen_id');
	}
}
