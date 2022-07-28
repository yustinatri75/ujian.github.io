<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterProdi
 * 
 * @property int $prodi_id
 * @property string $prodi_nama
 * @property string $prodi_kode
 * @property Carbon $prodi_created_at
 * @property Carbon|null $prodi_updated_at
 * 
 * @property Collection|MasterDosen[] $master_dosens
 * @property Collection|MasterMahasiswa[] $master_mahasiswas
 *
 * @package App\Models
 */
class MasterProdi extends Model
{
	protected $table = 'master_prodi';
	protected $primaryKey = 'prodi_id';
	public $timestamps = false;

	protected $dates = [
		'prodi_created_at',
		'prodi_updated_at'
	];

	protected $fillable = [
		'prodi_nama',
		'prodi_kode',
		'prodi_created_at',
		'prodi_updated_at'
	];

	public function master_dosens()
	{
		return $this->hasMany(MasterDosen::class, 'dosen_prodi_id');
	}

	public function master_mahasiswas()
	{
		return $this->hasMany(MasterMahasiswa::class, 'mhs_prodi_id');
	}
}
